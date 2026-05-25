import 'package:docdoc/core/constants/app_icons.dart';
import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Omnia!", style: TextStyles.size18BoldBlackColor),
            const Gap(2),
            Text("How Are you Today?", style: TextStyles.size12RegularTextGreyColor),
          ],
        ),
        const Spacer(),
        CircleAvatar(radius: 24.r, backgroundColor: AppColors.iconColor, child: SvgPicture.asset(AppIcons.notificationSvg)),
      ],
    );
  }
}
