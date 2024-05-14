import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:smart_home/core/networking/firebase_services.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._firebaseServices) : super(EditProfileInitial());
  final FirebaseServices _firebaseServices;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> editProfile() async {
    emit(EditProfileLoading());
    try {
      if (formKey.currentState!.validate()) {
        await _firebaseServices.editProfile(
          firstNameController.text,
          phoneNumberController.text,
          emailController.text,
          lastNameController.text,
        );
        emit(EditProfileSuccess());
      }else{
        emit(EditProfileFailed());
      }

    } catch (e) {
      print(e);
      emit(EditProfileFailed());
    }
  }
}
