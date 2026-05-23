import 'package:docdoc/core/components/buttons/main_button.dart';
import 'package:docdoc/core/utils/text_style.dart';
import 'package:docdoc/features/login/presentation/widgets/terms_codition_and_privacy_policy.dart';
import 'package:docdoc/features/signup/logic/cubit/signup_cubit.dart';
import 'package:docdoc/features/signup/presentation/widgets/already_have_anaccount.dart';
import 'package:docdoc/features/signup/presentation/widgets/signup_bloc_listener.dart';
import 'package:docdoc/features/signup/presentation/widgets/signup_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create Account', style: TextStyles.size24BoldPrimaryColor),
                  Gap(8.h),
                  Text('Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!', style: TextStyles.size15RegularGreyColor),
                  Gap(36.h),
                  const SignupFormField(),
                  Gap(41.h),
                  MainButton(
                    elevatedButtonText: "Create Account",
                    onPressed: () {
                      validateThenDoSignup(context);
                    },
                  ),
                  Gap(30.h),
                  const TermsCoditionAndPrivacyPolicy(),
                  Gap(80.h),
                  const Center(child: AlreadyHaveAnaccount()),
                  const SignupBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().signUp();
    }
  }
}
