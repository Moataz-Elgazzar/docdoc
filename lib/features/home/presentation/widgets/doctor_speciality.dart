import 'package:docdoc/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class DoctorSpeciality extends StatelessWidget {
  const DoctorSpeciality({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Doctor Speciality", style: TextStyles.size18SemiBoldBlackTextColor),
        TextButton(
          onPressed: () {},
          child: Text("See All", style: TextStyles.size12RegularPrimaryColor),
        ),
      ],
    );
  }
}
