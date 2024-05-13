import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/widgets/custom_text_field.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 30.w,
              child: const CustomTextField(
                fillColor: ColorStyles.darkGrey,
                focusedBorderColor: ColorStyles.darkGrey,
                hintText: 'First Name',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 30.w,
              child: const CustomTextField(
                hintText: 'Last Name',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                fillColor: ColorStyles.darkGrey,
                focusedBorderColor: ColorStyles.darkGrey,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        const CustomTextField(
          fillColor: ColorStyles.darkGrey,
          focusedBorderColor: ColorStyles.darkGrey,
          hintText: 'Email',
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
          height: 20.h,
        ),
        const CustomTextField(
          fillColor: ColorStyles.darkGrey,
          focusedBorderColor: ColorStyles.darkGrey,
          hintText: ' Confirm Password',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: 80.h,
        ),
      ],
    );
  }
}
