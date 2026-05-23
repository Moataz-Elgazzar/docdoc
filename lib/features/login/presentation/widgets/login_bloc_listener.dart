import 'package:docdoc/core/routes/navigator.dart';
import 'package:docdoc/core/routes/routes.dart';
import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/core/utils/text_style.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(child: CircularProgressIndicator(color: AppColors.primaryColor)),
            );
          },
          success: (loginResponse) {
            pop(context);
            pushAndRemoveUntil(context, Routes.home);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: AppColors.redColor, size: 32),
        content: Text(error, style: TextStyles.size16RegularBlackColor),
        actions: [
          TextButton(
            onPressed: () {
              pop(context);
            },
            child: Text("OK", style: TextStyles.size14semiBoldBlueColor),
          ),
        ],
      ),
    );
  }
}
