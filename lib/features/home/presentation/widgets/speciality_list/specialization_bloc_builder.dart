import 'package:docdoc/features/home/logic/cubit/home_cubit.dart';
import 'package:docdoc/features/home/logic/cubit/home_state.dart';
import 'package:docdoc/features/home/presentation/widgets/doctor_list/doctors_list_view.dart';
import 'package:docdoc/features/home/presentation/widgets/speciality_list/speciality_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      //buildWhen: (previous, current) => current is SpecializationLoading || current is SpecializationSuccess || current is SpecializationError,
      builder: (context, state) {
        return state.maybeWhen(
          specializationLoading: () {
            return const Center(child: CircularProgressIndicator());
          },
          specializationSuccess: (specializationDataList) {
            if (specializationDataList.isEmpty) {
              return const Center(child: Text('No Data Found'));
            }
            return Column(
              children: [
                SpecialityListView(specializationData: specializationDataList),
                const Gap(23),
            
                DoctorsListView(doctors: specializationDataList.first.doctorList),
              ],
            );
          },
          specializationError: (errorHandler) {
            return const SizedBox.shrink();
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
