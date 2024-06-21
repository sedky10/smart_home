import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/helper/image_assets.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';

class RoomsView extends StatefulWidget {
  const RoomsView({super.key});

  @override
  State<RoomsView> createState() => _RoomsViewState();
}

class _RoomsViewState extends State<RoomsView> {
  List<ScanResult> scanResults = [];
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    checkPermissions();
  }

  void checkPermissions() async {
    if (await Permission.location.isDenied) {
      await Permission.location.request();
    }
  }

  @override
  void dispose() {
    super.dispose();
    FlutterBluePlus.stopScan();
  }

  void startScan() async {
    setState(() {
      scanResults.clear();
      isScanning = true;
    });

    // Ensure Bluetooth is on and permissions are granted
    await FlutterBluePlus.adapterState
        .where((s) => s == BluetoothAdapterState.on)
        .first;

    // Check for any already connected system devices
    List<BluetoothDevice> systemDevices = await FlutterBluePlus.systemDevices;
    for (var d in systemDevices) {
      print('${d.platformName} already connected to! ${d.remoteId}');
    }

    // Listen to scan results
    var subscription = FlutterBluePlus.onScanResults.listen((results) {
      setState(() {
        print('Found ${results.length} devices!');
        scanResults = results;
      });
    }, onError: (e) => print(e));

    // Cleanup: cancel subscription when scanning stops
    FlutterBluePlus.cancelWhenScanComplete(subscription);

    // Start scanning without filters
    await FlutterBluePlus.startScan(
      androidUsesFineLocation: true,
      timeout: Duration(seconds: 15),
    );

    // Wait for scanning to stop
    await FlutterBluePlus.isScanning.where((val) => val == false).first;

    setState(() {
      isScanning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.blackLight,
      appBar: AppBar(
        backgroundColor: ColorStyles.blackLight,
        title: Text('Scan Device', style: TextStyles.font18WhiteMedium),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0.w),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isScanning ? ColorStyles.blue : ColorStyles.red),
              onPressed: isScanning
                  ? null
                  : () async {
                      PermissionStatus bluetoothStatus =
                          await Permission.bluetoothScan.request();
                      if (bluetoothStatus.isGranted) {
                        startScan();
                        // Either the permission was already granted before or the user just granted it.
                      }
                    },
              child: Text(isScanning ? 'Scanning...' : 'Start Scan',
                  style: TextStyles.font14WhiteBold),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          scanResults.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: scanResults.length,
                    itemBuilder: (context, index) {
                      final result = scanResults[index];
                      return Padding(
                        padding: EdgeInsets.all(padding),
                        child: ListTile(
                          title: Text(
                            result.device.remoteId.toString(),
                            style: TextStyles.font14WhiteBold,
                          ),
                          subtitle: Text(
                            result.device.advName ?? 'Unknown',
                            style: TextStyles.font14GreyMedium,
                          ),
                          trailing: const Icon(
                            FontAwesomeIcons.bluetooth,
                            color: ColorStyles.white,
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.bluetooth,
                        size: 100.0.sp,
                        color: ColorStyles.lightblue,
                      ),
                      SizedBox(height: 30.0.h),
                      Center(
                        child: Text(
                          'No devices found.......',
                          style: TextStyles.font20WhiteMedium,
                        ),
                      ),
                      SizedBox(height: 50.0.h),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}