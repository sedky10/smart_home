// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:smart_home/core/helper/constants.dart';

// part 'sensor_switch_state.dart';

// class SensorSwitchCubit extends Cubit<SensorSwitchState> {
//   SensorSwitchCubit() : super(SensorSwitchInitial());
//   List<bool> _values = [];
//   List<bool> get values => _values;
//   String roomName = '';

//   switchValue(bool val, int sensorIndex) {
//     emit(SensorSwitchInitial());

//     _values[sensorIndex] = val;
//     emit(SensorSwitchchanged());
//   }

//   getValues(String pageIndex) {
//     _values = List.filled(sensorTypes[pageIndex]!.length, false);
//     emit(SensorSwitchInitial());
//   }
// }
