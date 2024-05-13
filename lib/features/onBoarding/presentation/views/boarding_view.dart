import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/core/helper/constants.dart';
import 'package:smart_home/core/helper/image_assets.dart';
import 'package:smart_home/core/routing/app_routes.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';
import 'package:smart_home/core/widgets/custome_button.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagesAssets.onBoardingImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimateList(
              interval: 400.milliseconds,
              effects: [FadeEffect(duration: 300.ms)],
              children: [
                 SizedBox(
                  height: 100.h,
                ),
                Text(
                  'WELCOME',
                  style: TextStyles.font24BlackRegular,
                ),
                 SizedBox(
                  height: 20.h,
                ),
                Text(
                  'The best Experience To Make Your wonderful home more Smart',
                  style: TextStyles.font16BlackRegular,
                ),
                const Spacer(),
                 CustomButton(
                  title: 'START',
                  buttonmainColor: ColorStyles.grey,
                  onPressed: () {
                   GoRouter.of(context).go(AppRoutes.kRegisterView);
                  },
                )
              ],
            )),
      ),
    );
  }
}
