import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({super.key, required this.hintText, this.suffixIcon, this.obscureText, this.style, this.fillColor, this.filled, this.hintStyle, this.controller, this.enabledBorder, this.focusedBorder, this.contentPadding, this.keyboardType, this.textInputAction, this.textDirection});

  final String hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextStyle? style;
  final Color? fillColor;
  final bool? filled;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      showCursor: true,
      textDirection: textDirection,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.3.w),
              borderRadius: BorderRadius.circular(16.r),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.greyColorborder, width: 1.3.w),
              borderRadius: BorderRadius.circular(16.r),
            ),
        hintStyle: hintStyle ?? TextStyles.size14MediumGreyColor,
        hintText: hintText,
        filled: filled ?? true,
        fillColor: fillColor ?? AppColors.greyColorBackGroundFormField,
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText ?? false,
      style: style ?? TextStyles.size14MediumBlackColor,
    );
  }
}
