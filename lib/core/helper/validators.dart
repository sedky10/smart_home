import 'package:smart_home/core/helper/function/toast.dart';

String? validatePassword(String value) {
  if (value.isEmpty) {
    showToast(
      'كلمة المرور مطلوبة',
    );
    return 'كلمة المرور مطلوبة';
  } else if (value.length < 6) {
    return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
  }

  return null;
}

String? validateField(String value, String fieldName) {
  if (value.isEmpty) {
    showToast(
      'يجب إدخال $fieldName',
    );
    return '$fieldName لا يمكن أن يكون فارغاً';
  }

  if (value.length > 120) {
    showToast(
      '$fieldName يجب أن يكون أقل من 120 حرف',
    );
    return '$fieldName يجب أن يكون أقل من 120 حرف';
  }

  return null;
}

String? validateEmail(String value) {
  if (value.isEmpty) {
    showToast(
      'لايمكن ان يكون البريد الالكتروني فارغا',
    );
    return 'لايمكن ان يكون البريد الالكتروني فارغا';
  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    showToast(
      'من فضلك ادخل بريد الكتروني صالح',
    );
    return 'من فضلك ادخل بريد الكتروني صالح';
  }

  return null;
}

String? validatePhoneNumber(String value) {
  if (value.isEmpty) {
    showToast(
      'رقم الهاتف لا يمكن ان يكون فارغاً',
    );
    return 'رقم الهاتف لا يمكن ان يكون فارغاً';
  } else if (!RegExp(r'^(002)?01[0125][0-9]{8}$').hasMatch(value)) {
    showToast(
      'من فضلك ادخل رقم هاتف صحيح',
    );
    return 'من فضلك ادخل رقم هاتف صحيح';
  }

  return null;
}
