import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/widgets/custom_text_field.dart';

class UserLoginData extends StatelessWidget {
  const UserLoginData({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         SizedBox(
          height: 20.h,
        ),
        const CustomTextField(
          fillColor: ColorStyles.darkGrey,
          focusedBorderColor: ColorStyles.darkGrey,
          hintText: 'Email or Phone Number',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(
          height: 20.h,
        ),
        const CustomTextField(
          fillColor: ColorStyles.darkGrey,
          focusedBorderColor: ColorStyles.darkGrey,
          hintText: 'Password',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
        ),
         SizedBox(
          height: 100.h,
        ),
      ],
    );
  }
}