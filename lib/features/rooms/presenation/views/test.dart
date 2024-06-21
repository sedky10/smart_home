import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/features/rooms/presenation/manager/bluetooth%20connection/bluetooth_connection_cubit.dart';

class RoomsView extends StatelessWidget {
  const RoomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BluetoothConnectionCubit()..checkPermissions(),
      child: const RoomsViewContent(),
    );
  }
}

class RoomsViewContent extends StatelessWidget {
  const RoomsViewContent({super.key});

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
                backgroundColor: context.watch<BluetoothConnectionCubit>().state
                        is BluetoothScanning
                    ? ColorStyles.blue
                    : ColorStyles.red,
              ),
              onPressed: context.watch<BluetoothConnectionCubit>().state
                      is BluetoothScanning
                  ? null
                  : () async {
                      PermissionStatus bluetoothStatus =
                          await Permission.bluetoothScan.request();
                      if (bluetoothStatus.isGranted) {
                        context.watch<BluetoothConnectionCubit>().startScan();
                      }
                    },
              child: Text(
                context.watch<BluetoothConnectionCubit>().state
                        is BluetoothScanning
                    ? 'Scanning...'
                    : 'Start Scan',
                style: TextStyles.font14WhiteBold,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<BluetoothConnectionCubit, BluetoothConnectionSState>(
        builder: (context, state) {
          if (state is BluetoothScanResults) {
            return buildScanResults(state.results);
          } else if (state is BluetoothScanning) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ColorStyles.blue),
              ),
            );
          } else if (state is BluetoothScanError) {
            return Center(
              child: Text('Error: ${state.error}',
                  style: TextStyles.font20WhiteMedium),
            );
          } else {
            return buildNoDevicesFound();
          }
        },
      ),
    );
  }

  Widget buildScanResults(List<ScanResult> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results[index];
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
    );
  }

  Widget buildNoDevicesFound() {
    return Column(
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
    );
  }
}
