import 'package:docdoc/core/constants/app_images.dart';
import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingImageAndText extends StatelessWidget {
  const OnboardingImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          left: -80.w,
          child: SvgPicture.asset(AppImages.onboardingLowObasityLogo, height: 400.h, width: double.infinity),
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(colors: [AppColors.wightColor, AppColors.wightColor.withValues(alpha: 0.0)], begin: Alignment.bottomCenter, end: Alignment.topCenter, stops: [0.14, 0.4]),
          ),
          child: Image.asset(AppImages.onboardingImage, height: 491.h, width: double.infinity),
        ),
        Positioned(
          bottom: 30.h,
          left: 0,
          right: 0,
          child: Text("Best Doctor\nAppointment App", style: TextStyles.size32BoldPrimaryColor, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
