import 'package:docdoc/core/routes/navigator.dart';
import 'package:docdoc/core/routes/routes.dart';
import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/core/utils/text_style.dart';
import 'package:docdoc/features/signup/logic/cubit/signup_cubit.dart';
import 'package:docdoc/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) => current is SignupLoading || current is SignupSuccess || current is SignupError,
      listener: (context, state) {
         state.whenOrNull(
          signupLoading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(child: CircularProgressIndicator(color: AppColors.primaryColor)),
            );
          },
          signupSuccess: (signupResponse) {
            pop(context);
            showSuccessDialog(context);
          },
          signupError: (error) {
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

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Signup Successful", style: TextStyles.size12RegularPrimaryColor),
        content: Text("Congratulations, you have signed up successfully!", style: TextStyles.size14MediumBlackColor),
        actions: [
          TextButton(
            onPressed: () {
              pushWithReplacement(context, Routes.login);
            },
            child: Text("OK", style: TextStyles.size14semiBoldBlueColor),
          ),
        ],
      ),
    );
  }
}
