import 'package:docdoc/features/home/presentation/widgets/doctor_list/doctor_item.dart';
import 'package:flutter/material.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(padding: EdgeInsets.zero, shrinkWrap: true, scrollDirection: Axis.vertical, itemCount: 8, itemBuilder: (context, index) => DoctorItem()),
    );
  }
}
