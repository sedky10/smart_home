import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/core/widgets/custome_button.dart';
import 'package:smart_home/features/Register/presentation/views/widgets/register_dialoge.dart';

class VerifyEmailDialoge extends StatelessWidget {
  const VerifyEmailDialoge({super.key});

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
            'Verfiy Your Email! ',
            style: TextStyles.font18WhiteBold,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'please check your email to verify your account.',
            style: TextStyles.font14GreyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        CustomButton(
          title: 'done',
          buttonmainColor: ColorStyles.grey,
          onPressed: () {
            GoRouter.of(context).pop();
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const RegisterDialoge(),
            );
          },
        ),
      ],
    );
  }
}
