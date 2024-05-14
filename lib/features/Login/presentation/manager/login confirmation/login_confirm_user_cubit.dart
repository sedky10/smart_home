import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/core/networking/firebase_services.dart';

part 'login_confirm_user_state.dart';

class ConfirmLoginUserCubit extends Cubit<ConfirmLoginUserState> {
  ConfirmLoginUserCubit(this._firebaseServices)
      : super(ConfirmLoginUserInitial());
  final FirebaseServices _firebaseServices;

  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();
  TextEditingController otpController5 = TextEditingController();
  TextEditingController otpController6 = TextEditingController();
  String _email = '';
  String get email => _email;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void loginUser() async {
    emit(ConfirmLoginUserLoading());
    if (formKey.currentState!.validate()) {
      try {
        // await _firebaseServices.verifyEmailOtp(email,
        //     '${otpController1.text}${otpController2.text}${otpController3.text}${otpController4.text}${otpController5.text}${otpController6.text}');
        emit(ConfirmLoginUserSuccess());
      } catch (e) {
        emit(ConfirmLoginUserFailed());
      }
    } else {
      emit(ConfirmLoginUserFailed());
    }
  }

  void dispose() {
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
    otpController5.dispose();
    otpController6.dispose();
  }
}
