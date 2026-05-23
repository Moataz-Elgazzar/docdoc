import 'package:docdoc/core/utils/colors.dart';
import 'package:docdoc/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidation({super.key, required this.hasLowerCase, required this.hasUpperCase, required this.hasSpecialCharacters, required this.hasNumber, required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildValidationRow('At least 1 lowercase letter', hasLowerCase) ,
      buildValidationRow('At least 1 Uppercase letter', hasUpperCase) ,
      buildValidationRow('At least 1 Special Character letter', hasSpecialCharacters) ,
      buildValidationRow('At least 1 Number ', hasNumber) ,
      buildValidationRow('At least 8 characters long', hasMinLength) ,
    
    ]);
  }

  buildValidationRow(String text, bool hasVlidated) {
    return Row(
      children: [
        Icon(hasVlidated ? Icons.check_circle_outlined : Icons.cancel_rounded, color: hasVlidated ? AppColors.primaryColor : AppColors.redColor),
        const Gap(2),
        Text(text, style: TextStyles.size12RegularBlackColor),
      ],
    );
  }
}
