import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_home/core/utils/color_styles.dart';

showToast(String message, {ToastGravity? toastGravity}) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: ColorStyles.blue,
      textColor: ColorStyles.white,
      gravity: toastGravity ?? ToastGravity.BOTTOM);
}