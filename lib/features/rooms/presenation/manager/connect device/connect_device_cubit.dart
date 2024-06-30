import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:smart_home/core/helper/function/toast.dart';

part 'connect_device_state.dart';

class ConnectDeviceCubit extends Cubit<ConnectDeviceState> {
  BluetoothConnection? _cconnection;
  get  connection => _cconnection;

  ConnectDeviceCubit() : super(ConnectDeviceInitial());
  void connectDevice(BluetoothDevice device) async {
    emit(ConnectDeviceWaiting());
    try {
      await BluetoothConnection.toAddress(device.address).then((_connection) {
        _cconnection = _connection;

        emit(ConnectDeviceSuccess());
      }).catchError((error) {
        showToast(error.toString());
        emit(ConnectDeviceFailed());
      });
    } catch (e) {
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

        showToast(e.toString());
      }
    }
  }
}
