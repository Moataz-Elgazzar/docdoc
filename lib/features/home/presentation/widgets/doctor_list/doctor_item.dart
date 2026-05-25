import 'package:cached_network_image/cached_network_image.dart';
import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.wightColor),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(imageUrl: 'https://images.pexels.com/photos/5452293/pexels-photo-5452293.jpeg', height: 126.h, width: 110.w, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name", style: TextStyles.size16BoldBlackTextColor.copyWith(overflow: TextOverflow.ellipsis)),
                  const Gap(8),
                  Text("Degree", style: TextStyles.size12MediumGreyColor.copyWith(overflow: TextOverflow.ellipsis)),
                  const Gap(12),
                  Text("Email", style: TextStyles.size12MediumGreyColor.copyWith(overflow: TextOverflow.ellipsis)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
