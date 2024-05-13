import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchInitial());
  bool _value = false;
  bool get value => _value;

  switchValue(val) {
    emit(SwitchInitial());
    _value = val;
    emit(SwitchChange());
  }
}
