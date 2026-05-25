import 'package:docdoc/features/home/presentation/widgets/doctor_container_blue.dart';
import 'package:docdoc/features/home/presentation/widgets/doctor_speciality.dart';
import 'package:docdoc/features/home/presentation/widgets/home_top_bar.dart';
import 'package:docdoc/features/home/presentation/widgets/speciality_list/specialization_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 18.h),
          width: double.infinity,
          child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [HomeTopBar(), DoctorContainerBlue(), Gap(24), DoctorSpeciality(), Gap(16), Expanded(child: SpecializationBlocBuilder())]),
        ),
      ),
    );
  }
}
