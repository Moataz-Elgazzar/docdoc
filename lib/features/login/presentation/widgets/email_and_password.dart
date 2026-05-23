import 'package:docdoc/core/helper/app_regex.dart';
import 'package:docdoc/core/widgets/app_text_form_field.dart';
import 'package:docdoc/features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/features/login/presentation/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObsecure = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool showValidation = false;

  late TextEditingController passwordController;
  late FocusNode passwordFocusNode;

  @override
  void initState() {
    passwordController = context.read<LoginCubit>().paswswordController;
    passwordFocusNode = FocusNode();
    setpasswordControllerListener();
    setShowValidationListener();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: cubit.emailController,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return "Please Enter a valid Email";
              }
              return null;
            },
          ),
          Gap(16.h),
          AppTextFormField(
            focusNode: passwordFocusNode,
            controller: cubit.paswswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter a valid Password";
              }
              return null;
            },
            keyboardType: TextInputType.text,
            hintText: 'Password',
            obscureText: isObsecure,
            suffixIcon: isObsecure
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    },
                    child: const Icon(Icons.visibility_off),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        isObsecure = !isObsecure;
                      });
                    },
                    child: const Icon(Icons.visibility),
                  ),
          ),
          const Gap(20),
          if (showValidation) ...[PasswordValidation(hasLowerCase: hasLowercase, hasUpperCase: hasUppercase, hasSpecialCharacters: hasSpecialCharacters, hasNumber: hasNumber, hasMinLength: hasMinLength)],
        ],
      ),
    );
  }

  void setpasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  void setShowValidationListener() {
    passwordFocusNode.addListener(() {
      setState(() {
        showValidation = passwordFocusNode.hasFocus;
      });
    });
  }
}
