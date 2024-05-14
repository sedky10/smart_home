import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/core/networking/firebase_services.dart';

part 'login_user_state.dart';

class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit(this._firebaseServices) : super(LoginUserInitial());
  final FirebaseServices _firebaseServices;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // String _verificationId = '';
  // String get verifiedId => _verificationId;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void loginUser() async {
    emit(LoginUserLoading());
    if (formKey.currentState!.validate()) {
      try {
        await _firebaseServices
            .logIn(emailController.text, passwordController.text)
            .then((value) => value != null
                ? value.emailVerified
                    ? emit(LoginUserSuccess())
                    : emit(
                        const LoginUserFailed('Email not verified'),
                      )
                : emit(const LoginUserFailed('Invalid Email or Password')));
      } catch (e) {
        emit(LoginUserFailed(e.toString()));
      }
    } else {
      emit(const LoginUserFailed('Something went wrong!'));
    }
  }

  // verificationCompleted(PhoneAuthCredential credential) {}
  // verificationFailed(FirebaseAuthException e) {
  //   print(e);
  //   print('================================================');
  // }

  // codeSent(String verificationId, int? resendToken) {
  //   verificationId = _verificationId;
  //   if (kDebugMode) {
  //     print("------------------->   Code Sent");
  //   }
  // }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
