import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/core/helper/function/toast.dart';
import 'package:smart_home/core/networking/firebase_services.dart';

part 'register_user_state.dart';

class RegisterUserCubit extends Cubit<RegisterUserState> {
  RegisterUserCubit(this._firebaseServices) : super(RegisterUserInitial());
  final FirebaseServices _firebaseServices;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void registerUser() async {
    emit(RegisterUserLoading());
    if (formKey.currentState!.validate()) {
      if (confirmPasswordController.text == passwordController.text) {
        try {
          await _firebaseServices.signUp(
              emailController.text, passwordController.text);
          await _firebaseServices.addUserData(
              firstNameController.text, lastNameController.text);
          emit(RegisterUserSuccess());
        } catch (e) {
          emit(RegisterUserFailed());
        }
      } else {
        showToast('password not match');
        emit(RegisterUserFailed());
      }
    } else {
      emit(RegisterUserFailed());
    }
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
  }
}
