import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

part 'bluetooth_connection_state.dart';

class BluetoothConnectionCubit extends Cubit<BluetoothConnectionSState> {
  BluetoothConnectionCubit() : super(BluetoothConnectionInitial());

  Future<void> checkPermissions() async {
    if (await Permission.location.isDenied) {
      await Permission.location.request();
    }
    if (await Permission.bluetoothScan.isDenied) {
      await Permission.bluetoothScan.request();
    }
    
  }

  void startScan() async {
    emit(BluetoothScanning());

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
      emit(BluetoothScanResults(results));
    }, onError: (e) => emit(BluetoothScanError(e.toString())));

    // Cleanup: cancel subscription when scanning stops
    FlutterBluePlus.cancelWhenScanComplete(subscription);

    // Start scanning without filters
    await FlutterBluePlus.startScan(
      androidUsesFineLocation: true,
      timeout: Duration(seconds: 15),
    );

    // Wait for scanning to stop
    await FlutterBluePlus.isScanning.where((val) => val == false).first;

    emit(BluetoothScanComplete());
  }

  void stopScan() async {
    await FlutterBluePlus.stopScan();
    emit(BluetoothScanComplete());
  }
}
