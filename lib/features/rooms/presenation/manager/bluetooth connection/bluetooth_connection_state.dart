part of 'bluetooth_connection_cubit.dart';

sealed class BluetoothConnectionSState extends Equatable {
  const BluetoothConnectionSState();

  @override
  List<Object> get props => [];
}

final class BluetoothConnectionInitial extends BluetoothConnectionSState {}
final class BluetoothScanning  extends BluetoothConnectionSState {}
final class BluetoothScanResults  extends BluetoothConnectionSState {
   final List<ScanResult> results;

  const BluetoothScanResults(this.results);
}
final class BluetoothScanError  extends BluetoothConnectionSState {
    final String error;

  const BluetoothScanError(this.error);
}
final class BluetoothScanComplete   extends BluetoothConnectionSState {}
