import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_user_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit() : super(RegisterUserInitial());

  void registerUser(String email, String password, String firstName, String lastName) {
    emit(RegisterUserLoading());
    try {
      // Call the FirebaseServices signUp method
      // Call the FirebaseServices addUserData method
      emit(RegisterUserSuccess());
    } catch (e) {
      emit(RegisterUserFailed());
    }
  }
}
