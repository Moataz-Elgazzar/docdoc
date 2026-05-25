import 'package:docdoc/core/networking/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:docdoc/features/login/data/models/login_request_body.dart';
import 'package:docdoc/features/login/data/models/login_response.dart';
import 'package:docdoc/features/signup/data/models/signup_request_body.dart';
import 'package:docdoc/features/signup/data/models/signup_response_body.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseurl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //login
  @POST(ApiEndpoints.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  //signup
  @POST(ApiEndpoints.signup)
  Future<SignupResponseBody> signup(@Body() SignupRequestBody sigupRequestBody);

  //home
  @GET(ApiEndpoints.specialization)
  Future<SpecializationResponseModel> getSpecialization();
}
