import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';

part 'bluetooth_connection_state.dart';

class BluetoothConnectionCubit extends Cubit<BluetoothConnectionSState> {
  BluetoothConnectionCubit() : super(BluetoothConnectionInitial());
  
  List<BluetoothDiscoveryResult> _scanResults = [];
  List<BluetoothDiscoveryResult> get results => _scanResults;
  bool _isScanning = false;
  bool get isScanning => _isScanning;
  
  StreamSubscription<BluetoothDiscoveryResult>? _discoveryStreamSubscription;

  Future<void> checkPermissions() async {
    if (await Permission.location.isDenied) {
      await Permission.location.request();
    }
  }

  void startScan() async {
    await checkPermissions();
    _scanResults.clear();
    _isScanning = true;
    emit(BluetoothScanning());

    // Ensure Bluetooth is on
    FlutterBluetoothSerial.instance.state.then((state) {
      // if (state != BluetoothState.STATE_ON) {
      //   emit(BluetoothScanError('Bluetooth is not turned on'));
      //   return;
      // }

    });
    
    

    // Stop any ongoing discovery
    _discoveryStreamSubscription?.cancel();

    // Start scanning
    _discoveryStreamSubscription = FlutterBluetoothSerial.instance.startDiscovery().listen((result) {
      _scanResults.add(result);
    
    }, onError: (e) {
      emit(BluetoothScanError(e.toString()));
    });

    // Wait for scanning to stop
    await Future.delayed(const Duration(seconds: 5));
      emit(BluetoothScanComplete());
    await _discoveryStreamSubscription!.cancel();
    
    _isScanning = false;
  
  }

  @override
  Future<void> close() {
    _discoveryStreamSubscription?.cancel();
    return super.close();
  }
}
