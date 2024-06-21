part of 'bluetooth_connect_cubit.dart';

sealed class BluetoothConnectState extends Equatable {
  const BluetoothConnectState();

  @override
  List<Object> get props => [];
}

final class BluetoothConnectInitial extends BluetoothConnectState {}
final class BluetoothConnectSuccess extends BluetoothConnectState {}
final class BluetoothConnectFailed extends BluetoothConnectState {}
final class BluetoothConnectWaiting extends BluetoothConnectState {}
