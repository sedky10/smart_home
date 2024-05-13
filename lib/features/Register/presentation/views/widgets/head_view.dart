import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageItem extends StatelessWidget {
  const ImageItem( {super.key, required this.image});
  final String? image;
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
        ),
      ],
    );
  }
}
