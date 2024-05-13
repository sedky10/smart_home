import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/routing/app_routes.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/core/widgets/custome_button.dart';
import 'package:smart_home/features/Register/presentation/views/widgets/register_dialoge.dart';

class Registeritem extends StatelessWidget {
  const Registeritem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          title: 'Sign Up',
          buttonmainColor: ColorStyles.darkGrey,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => const RegisterDialoge(),
            );
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyles.font12GreyBold,
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go(AppRoutes.kLoginView);
              },
              child: Text(
                'Sign In',
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
