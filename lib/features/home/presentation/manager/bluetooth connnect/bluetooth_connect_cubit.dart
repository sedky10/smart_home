
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

part 'bluetooth_connect_state.dart';

class BluetoothConnectCubit extends Cubit<BluetoothConnectState> {
  BluetoothConnectCubit() : super(BluetoothConnectInitial());

  connectFlutterBluetooth() async {
    emit(BluetoothConnectWaiting());
    var connect = await FlutterBluetoothSerial.instance.requestEnable();
    if (connect??false) {
      emit(BluetoothConnectSuccess());
    } else {
      emit(BluetoothConnectFailed());
    }
  }
}
