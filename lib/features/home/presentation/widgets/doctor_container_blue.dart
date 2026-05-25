import 'package:docdoc/core/constants/app_images.dart';
import 'package:docdoc/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DoctorContainerBlue extends StatelessWidget {
  const DoctorContainerBlue({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 187.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            width: double.infinity,
            height: 177,
            decoration: BoxDecoration(
              image: const DecorationImage(image: AssetImage(AppImages.doctorContainerBlueBackground)),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Book and\nschedule with\nnearest doctor", style: TextStyles.size18MediumWighteColor, textAlign: TextAlign.start),
                  const Gap(15),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        overlayColor: Colors.transparent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(48)),
                      ),
                      onPressed: () {},
                      child: Text("Find Nearby", style: TextStyles.size12RegularPrimaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0.5.w,
            child: Image.asset(AppImages.doctorContainer, height: 197.h),
          ),
        ],
      ),
    );
  }
}
