import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.elevatedButtonText, required this.onPressed});

  final String elevatedButtonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(top: 14.h, bottom: 14.h, left: 12.w, right: 12.w),
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        ),
        child: Text(elevatedButtonText, style: TextStyles.size16SemiBoldwhiteColor),
      ),
    );
  }
}
