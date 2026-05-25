import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:docdoc/features/home/presentation/widgets/speciality_list/speciality_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityListView extends StatelessWidget {
  const SpecialityListView({super.key, required this.specializationData});

  final List<SpecializationData> specializationData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: specializationData.length,
        itemBuilder: (BuildContext context, int index) => SpecialityListItem(indexItem: index, specializationData: specializationData[index]),
      ),
    );
  }
}
