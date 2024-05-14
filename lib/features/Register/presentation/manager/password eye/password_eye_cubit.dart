import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_eye_state.dart';

class PasswordEyeCubit extends Cubit<PasswordEyeState> {
  PasswordEyeCubit() : super(PasswordEyeInitial());

  bool visible = true;

  void changeVisibility() {
    emit(PasswordEyeInitial());
    visible = !visible;

    emit(PasswordEyeChanged());
  }
}
