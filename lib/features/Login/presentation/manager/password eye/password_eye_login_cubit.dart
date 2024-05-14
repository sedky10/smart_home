import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_eye_login_state.dart';

class PasswordEyeLoginCubit extends Cubit<PasswordEyeLoginState> {
  PasswordEyeLoginCubit() : super(PasswordEyeLoginInitial());

  bool visible = true;

  void changeVisibility() {
    emit(PasswordEyeLoginInitial());
    visible = !visible;

    emit(PasswordEyeLoginChanged());
  }
}
