import 'package:docdoc/core/helper/app_regex.dart';
import 'package:docdoc/core/widgets/app_text_form_field.dart';
import 'package:docdoc/features/login/presentation/widgets/password_validation.dart';
import 'package:docdoc/features/signup/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignupFormField extends StatefulWidget {
  const SignupFormField({super.key});

  @override
  State<SignupFormField> createState() => _SignupFormFieldState();
}

class _SignupFormFieldState extends State<SignupFormField> {
  bool isObsecure = true;
  bool isPasswordConfirmationObscureText = true;
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
    passwordController = context.read<SignupCubit>().paswswordController;
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
    final cubit = context.read<SignupCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            textInputAction: TextInputAction.next,
            hintText: 'name',
            validator: ((value) {
              if (value == null || value.isEmpty) {
                return "Please Enter a valid Name";
              }
              return null;
            }),
            controller: cubit.nameController,
            keyboardType: TextInputType.name,
          ),
          Gap(16.h),
          AppTextFormField(
            textInputAction: TextInputAction.next,
            controller: cubit.phoneController,
            hintText: 'Phone',
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                return "Please Enter a valid Phone Number";
              }
              return null;
            },
          ),
          Gap(16.h),
          AppTextFormField(
            textInputAction: TextInputAction.next,
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
            textInputAction: TextInputAction.next,
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
          Gap(16.h),
          if (showValidation) ...[PasswordValidation(hasLowerCase: hasLowercase, hasUpperCase: hasUppercase, hasSpecialCharacters: hasSpecialCharacters, hasNumber: hasNumber, hasMinLength: hasMinLength)],
          AppTextFormField(
            textInputAction: TextInputAction.next,
            controller: cubit.confirmPaswswordController,
            validator: (value) {
              if (value == null || value.isEmpty || value != passwordController.text) {
                return "Please Enter a valid Password";
              }
              return null;
            },
            keyboardType: TextInputType.text,
            hintText: 'Password Confirmation',
            obscureText: isPasswordConfirmationObscureText,
            suffixIcon: isPasswordConfirmationObscureText
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isPasswordConfirmationObscureText = !isPasswordConfirmationObscureText;
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
