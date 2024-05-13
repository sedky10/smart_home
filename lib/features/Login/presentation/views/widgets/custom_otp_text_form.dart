import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';

class OtpTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool haveNext;
  final bool havePrevious;
  final bool autoFocus;

  const OtpTextFormField(
      {super.key,
      this.haveNext = true,
      this.havePrevious = true,
      required this.controller,
      this.autoFocus = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 65.h,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter Verification Code";
          }
          return null;
        },
        autofocus: autoFocus,
        controller: controller,
        cursorColor: ColorStyles.white,
        onChanged: (value) {
          if (value.length == 1 && haveNext) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && havePrevious) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: InputDecoration(
          hintText: "*",
          hintStyle: TextStyles.font18WhiteBold.copyWith(
            color: ColorStyles.grey,
           
          ),
          errorStyle: TextStyle(
            fontSize: 0.sp,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorStyles.red,
              width: 2.sp,
            ),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorStyles.darkGrey,
              width: 3.sp,
            ),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorStyles.grey,
              width: 3.sp,
            ),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          fillColor: ColorStyles.blackLight,
          filled: true,
        ),
        style: TextStyles.font18WhiteBold,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
