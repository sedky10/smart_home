import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            FontAwesomeIcons.exclamationTriangle,
            size: 50.r,
            color: ColorStyles.red,
          ),
          Text(
            'Error',
            style: TextStyles.font18WhiteMedium,
          ),
        ],
      ),
    );
  }
}
