import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import '../utils/color_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.title, this.onPressed, this.buttonmainColor});

  final String title;
  final void Function()? onPressed;
  final Color? buttonmainColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
        ),
        overlayColor: const MaterialStatePropertyAll(Colors.white12),
        fixedSize: MaterialStatePropertyAll(
          Size(
            MediaQuery.sizeOf(context).width,
            55.h,
          ),
        ),
        backgroundColor:
            MaterialStatePropertyAll(buttonmainColor ?? ColorStyles.blue),
      ),
      child: Text(
        title,
        style: TextStyles.font20WhiteMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}