import 'package:docdoc/core/constants/app_images.dart';
import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SpecialityListItem extends StatelessWidget {
  final int indexItem;
  const SpecialityListItem({super.key, required this.indexItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: indexItem == 0 ? 0 : 24),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.circleSpecialtyColor,
            child: SvgPicture.asset(AppImages.doctorSpeciality, height: 30.h, width: 30.w),
          ),
          const Gap(12),
          Text("General", style: TextStyles.size12RegularBlackColor),
        ],
      ),
    );
  }
}
