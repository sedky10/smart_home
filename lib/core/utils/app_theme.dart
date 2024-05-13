import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_home/core/utils/color_styles.dart';

ThemeData theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    elevation: 0,
    shadowColor: ColorStyles.blackLight.withOpacity(0.25),
    // titleTextStyle: TextStyles.font20BlueBold,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  fontFamily: "poppins",
  useMaterial3: true,
);
