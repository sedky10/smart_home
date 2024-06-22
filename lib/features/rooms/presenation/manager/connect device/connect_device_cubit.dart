import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:smart_home/core/helper/function/toast.dart';

part 'connect_device_state.dart';

class ConnectDeviceCubit extends Cubit<ConnectDeviceState> {
  BluetoothConnection? _cconnection ;
  get connection => _cconnection;

  ConnectDeviceCubit() : super(ConnectDeviceInitial());
  void connectDevice(BluetoothDevice device) async {
    emit(ConnectDeviceWaiting());
    try {
      print('first');
      await BluetoothConnection.toAddress(device.address).then((_connection) {
        _cconnection = _connection;
        print('111111111111');
        emit(ConnectDeviceSuccess());
      }).catchError((error) {
        print('11111111111111111111111111111111111');
        print(error);
        showToast(error.toString());
        emit(ConnectDeviceFailed());
      });
    } catch (e) {
      print('11111111111111111111111111111111111');
      print(e);
      showToast(e.toString());
      emit(ConnectDeviceFailed());
    }
  }

  void disconnectDevice() async {
   
    emit(ConnectDeviceCamcelWaiting());
    if (_cconnection!.isConnected) {
      try {
        await _cconnection!.close();
        emit(ConnectDeviceCamcelSuccess());
        emit(ConnectDeviceInitial());
      } catch (e) {
        emit(ConnectDeviceCamcelFailed());
        print('22222222222222222222222222222222222');
        print(e);
        showToast(e.toString());
      }
    }
  }
}
