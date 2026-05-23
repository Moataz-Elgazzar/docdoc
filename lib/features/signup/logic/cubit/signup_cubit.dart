import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/signup/data/models/signup_request_body.dart';
import 'package:docdoc/features/signup/data/repos/signup_repo.dart';
import 'package:docdoc/features/signup/logic/cubit/signup_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController paswswordController = TextEditingController();
  final TextEditingController confirmPaswswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  void signUp() async {
    emit(const SignupState.signupLoading());
    final response = await _signupRepo.signUp(SignupRequestBody(name: nameController.text, email: emailController.text, phone: phoneController.text, password: paswswordController.text, passwordConfirmation: confirmPaswswordController.text, gender: 0));
    response.when(
      success: (signupResponse) {
        emit(SignupState.signupSuccess(signupResponse));
      },
      failure: (error) {
        emit(SignupState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
