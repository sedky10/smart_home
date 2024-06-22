part of 'connect_device_cubit.dart';

sealed class ConnectDeviceState extends Equatable {
  const ConnectDeviceState();

  @override
  List<Object> get props => [];
}

final class ConnectDeviceInitial extends ConnectDeviceState {}
final class ConnectDeviceWaiting extends ConnectDeviceState {}
final class ConnectDeviceFailed extends ConnectDeviceState {}
final class ConnectDeviceSuccess extends ConnectDeviceState {}
final class ConnectDeviceCamcelSuccess extends ConnectDeviceState {}
final class ConnectDeviceCamcelWaiting extends ConnectDeviceState {}
final class ConnectDeviceCamcelFailed extends ConnectDeviceState {}
