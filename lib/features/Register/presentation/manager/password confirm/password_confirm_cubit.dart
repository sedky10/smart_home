import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'password_confirm_state.dart';

class PasswordConfirmCubit extends Cubit<PasswordConfirmState> {
  PasswordConfirmCubit() : super(PasswordConfirmInitial());

  bool visible = true;

  void changeVisibility() {
    emit(PasswordConfirmInitial());
    visible = !visible;

    emit(PasswordConfirmChanged());
  }
}
