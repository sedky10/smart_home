import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/routing/app_routes.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/core/widgets/custome_button.dart';

class LoginItem extends StatelessWidget {
  const LoginItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          title: 'Login',
          buttonmainColor: ColorStyles.darkGrey,
          onPressed: () {
           GoRouter.of(context).go(AppRoutes.kConfirmationLoginView);
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: TextStyles.font12GreyBold,
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go(AppRoutes.kRegisterView); 
              },
              child: Text(
                'Sign Up',
                style: TextStyles.font18WhiteBold.copyWith(
                  color: ColorStyles.blue,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
