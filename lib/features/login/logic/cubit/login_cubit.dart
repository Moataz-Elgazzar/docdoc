import 'package:docdoc/core/helper/shared_preferences_helper.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:docdoc/features/login/data/models/login_request_body.dart';
import 'package:docdoc/features/login/data/repos/login_repo.dart';
import 'package:docdoc/features/login/logic/cubit/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController paswswordController = TextEditingController();

  void login() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(LoginRequestBody(email: emailController.text, password: paswswordController.text));
    response.when(
      success: (loginResponse) async {
        await seveUserToken(loginResponse.userData?.token ?? '');
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  Future<void> seveUserToken(String token) async {
    await SharedPreferencesHelper.setSecuredString(SharedPrefKeys.kUserToken, token);
    DioFactory.setTokenInHeaderAfterLogin(token);
  }
}
