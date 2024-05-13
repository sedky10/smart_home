import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/routing/app_routes.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/core/widgets/custome_button.dart';
import 'package:smart_home/features/Login/presentation/views/widgets/verfication_code_row.dart';

class LoginConfirmation extends StatelessWidget {
  const LoginConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.blackLight,
      appBar: AppBar(
        backgroundColor: ColorStyles.blackLight,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: ColorStyles.grey,
            size: 30.sp,
          ),
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRoutes.kLoginView);
          },
        ),
        title: Text(
          'Login Confirmation',
          style: TextStyles.font18WhiteBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Icon(Icons.password_rounded,
                color: ColorStyles.lightblue, size: 200.sp),
            Text(
              'Enter the verification code sent to your email',
              style: TextStyles.font14GreyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            const VerificationCodeRow(),
            SizedBox(height: 60.h),
            CustomButton(
              title: 'Confirm',
              buttonmainColor: ColorStyles.darkGrey,
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRoutes.kNavigationView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
