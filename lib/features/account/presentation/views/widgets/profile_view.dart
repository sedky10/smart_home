import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView(
      {super.key,
      required this.userName,
      required this.phoneNumber,
      required this.email});
  final String userName;
  final String phoneNumber;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 40.h,
        ),
        Icon(
          Icons.account_circle,
          size: 150.r,
          color: ColorStyles.lightblue,
        )
            .animate()
            .fadeIn(
              duration: 800.milliseconds,
              curve: Curves.easeIn,
            )
            .slideY(),
        Text(
          userName,
          style: TextStyles.font18WhiteMedium,
        )
            .animate()
            .fadeIn(
              duration: 800.milliseconds,
              curve: Curves.easeIn,
            )
            .moveY(),
        Text(
          phoneNumber,
          style: TextStyles.font14GreyMedium,
        )
            .animate()
            .fadeIn(
              duration: 800.milliseconds,
              curve: Curves.easeIn,
            )
            .moveX(),
        Text(
          email,
          style: TextStyles.font14GreyMedium,
        )
            .animate()
            .fadeIn(
              duration: 800.milliseconds,
              curve: Curves.easeIn,
            )
            .moveX(),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
