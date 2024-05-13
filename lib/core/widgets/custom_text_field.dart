import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home/core/utils/color_styles.dart';
import 'package:smart_home/core/utils/text%20styles/text_styles.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.closeOnTapOutside = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.onFieldSubmitted,
    this.validator,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.horizontalContentPadding = 16.0,
    this.verticalContentPadding = 15.0,
    this.onChanged,
    this.hintStyle,
    this.borderRadius = 8.0,
    this.fillColor = ColorStyles.white,
    this.focusedBorderColor = ColorStyles.blue,
    this.inputFormatters,
  });

  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final bool closeOnTapOutside;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final double horizontalContentPadding;
  final double verticalContentPadding;
  final void Function(String)? onChanged;
  final TextStyle? hintStyle;
  final double borderRadius;
  final Color fillColor;
  final Color focusedBorderColor;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyles.font18WhiteRegular,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      maxLength: maxLength,
      obscureText: obscureText,
      onChanged: onChanged,
      cursorColor: ColorStyles.white,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(
          horizontal: horizontalContentPadding.w,
          vertical: verticalContentPadding.h,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintStyle: hintStyle ?? TextStyles.font14WhiteMedium,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: ColorStyles.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: ColorStyles.red),
        ),
      ),
    );
  }
}