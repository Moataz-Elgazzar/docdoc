import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/core/networking/api_service.dart';
import 'package:docdoc/features/home/data/models/specialization_response_model.dart';

class HomeRepo {
  final ApiService _apiService;
  HomeRepo(this._apiService);

  Future<ApiResult<SpecializationResponseModel>> getSpecialization() async {
    try {
      final response = await _apiService.getSpecialization();
      return ApiResult.success(response);
    } on Exception catch (error) {
     return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
