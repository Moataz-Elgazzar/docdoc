import 'package:docdoc/core/utils/text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnaccount extends StatelessWidget {
  const AlreadyHaveAnaccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(text: "Already have an account yet?  ", style: TextStyles.size12RegularBlackColor),
          TextSpan(text: "Sign Up", style: TextStyles.size12RegularPrimaryColor, recognizer: TapGestureRecognizer()..onTap = () {}),
        ],
      ),
    );
  }
}
