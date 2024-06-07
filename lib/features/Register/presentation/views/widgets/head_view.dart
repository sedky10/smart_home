import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.image, required this.title});
  final String? image;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80.h,
        ),
        Image.asset(
          image!,
          height: 200.h,
          fit: BoxFit.cover,
        )
            .animate()
            .fadeIn(
              duration: 800.milliseconds,
              curve: Curves.easeIn,
            )
            .slideY(),
        SizedBox(
          height: 10.h,
        ),
        Text(
          title!,
          style: TextStyles.font14GreyMedium,
          textAlign: TextAlign.center,
        )
            .animate()
            .fadeIn(
              duration: 800.milliseconds,
              curve: Curves.easeIn,
            )
            .move(),
      ],
    );
  }
}
