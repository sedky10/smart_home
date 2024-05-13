import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/routing/app_routes.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/core/widgets/custome_button.dart';

class RegisterDialoge extends StatelessWidget {
  const RegisterDialoge({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorStyles.blackLight,
      title: Icon(
        Icons.check_circle,
        color: ColorStyles.lightblue,
        size: 90.sp,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Success! ',
            style: TextStyles.font18WhiteBold,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Congratulation! You have been  successfully signed up.',
            style: TextStyles.font14GreyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        CustomButton(
          title: 'Next',
          buttonmainColor: ColorStyles.grey,
          onPressed: () {
            GoRouter.of(context)
                .go(AppRoutes.kLoginView);
          },
        ),
      ],
    );
  }
}
