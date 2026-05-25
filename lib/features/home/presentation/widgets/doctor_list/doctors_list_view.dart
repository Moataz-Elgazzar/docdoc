import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:docdoc/features/home/presentation/widgets/doctor_list/doctor_item.dart';
import 'package:flutter/material.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key, required this.doctors});

  final List<Doctors> doctors;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,

      scrollDirection: Axis.vertical,
      itemCount: doctors.length,
      itemBuilder: (context, index) => DoctorItem(doctor: doctors[index]),
    );
  }
}
