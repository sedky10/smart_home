import 'package:smart_home/core/helper/function/toast.dart';

String? validatePassword(String value) {
  if (value.isEmpty) {
    showToast(
      'password can not be empty',
    );
    return 'password can not be empty';
  } else if (value.length < 8) {
    return 'password must be at least 8 characters';
  }

  return null;
}

String? validateField(String value, String fieldName) {
  if (value.isEmpty) {
    showToast(
      '$fieldName can not be empty',
    );
    return '$fieldName can not be empty';
  }

  if (value.length > 30) {
    showToast(
      '$fieldName can not be more than 30 characters',
    );
    return '$fieldName can not be more than 30 characters';
  }

  return null;
}

String? validateEmail(String value) {
  if (value.isEmpty) {
    showToast(
      'email can not be empty',
    );
    return 'email can not be empty';
  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    showToast(
      'please enter a valid email',
    );
    return 'please enter a valid email';
  }

  return null;
}

String? validatePhoneNumber(String value) {
  if (value.isEmpty) {
    showToast(
      'phone number can not be empty',
    );
    return 'phone number can not be empty';
  } else if (!RegExp(r'^(002)?01[0125][0-9]{8}$').hasMatch(value)) {
    showToast(
      'please enter a valid phone number',
    );
    return 'please enter a valid phone number';
  }

  return null;
}
