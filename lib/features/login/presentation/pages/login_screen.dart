import 'package:docdoc/core/components/buttons/main_button.dart';
import 'package:docdoc/core/utils/text_style.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/login/presentation/widgets/dont_have_anaccount.dart';
import 'package:docdoc/features/login/presentation/widgets/email_and_password.dart';
import 'package:docdoc/features/login/presentation/widgets/login_bloc_listener.dart';
import 'package:docdoc/features/login/presentation/widgets/terms_codition_and_privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObsecure = true;

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
                  Text('Welcome Back', style: TextStyles.size24BoldPrimaryColor),
                  Gap(8.h),
                  Text('We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.', style: TextStyles.size15RegularGreyColor),
                  Gap(36.h),
                  const EmailAndPassword(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero, overlayColor: Colors.transparent),
                      onPressed: () {},
                      child: Text('Forgot Password?', style: TextStyles.size12RegularPrimaryColor),
                    ),
                  ),
                  Gap(41.h),
                  MainButton(
                    elevatedButtonText: "Login",
                    onPressed: () {
                      validateThenDoLogin();
                    },
                  ),
                  Gap(30.h),
                  const TermsCoditionAndPrivacyPolicy(),
                  Gap(80.h),
                  const Center(child: DontHaveAnaccount()),
                  const LoginBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin() {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().login();
    }
  }
}
