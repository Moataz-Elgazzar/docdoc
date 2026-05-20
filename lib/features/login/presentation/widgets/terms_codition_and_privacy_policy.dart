import 'package:docdoc/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsCoditionAndPrivacyPolicy extends StatelessWidget {
  const TermsCoditionAndPrivacyPolicy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: "By logging, you agree to our  ", style: TextStyles.size12RegularGreyColor),
          TextSpan(text: "Terms & Conditions  ", style: TextStyles.size12RegularBlackColor),
          TextSpan(text: "and   ", style: TextStyles.size12RegularGreyColor),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyles.size12RegularBlackColor.copyWith(height: 1.5.h),
          ),
        ],
      ),
    );
  }
}
