import 'package:docdoc/core/components/buttons/main_button.dart';
import 'package:docdoc/core/constants/app_images.dart';
import 'package:docdoc/core/utils/text_style.dart';
import 'package:docdoc/features/onboarding/widgets/onboarding_image_and_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(AppImages.onboardingLogo, height: 110.h, width: 200.w),
          ),

          const OnboardingImageAndText(),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                Text("Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.", style: TextStyles.size13RegularGreyColor, textAlign: TextAlign.center),
                Gap(20.h),
                
                MainButton(elevatedButtonText: 'Get Started', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
