import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    final timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptors();
      addDioHeder();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptors() {
    dio?.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true, responseBody: true));
  }

  static void addDioHeder() {
    dio?.options.headers = {'Accept': 'application/json', 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzc5NzE2Mzg1LCJleHAiOjE3Nzk4MDI3ODUsIm5iZiI6MTc3OTcxNjM4NSwianRpIjoiZndXVlZxbk5oeGFzdjJsdyIsInN1YiI6IjcwODAiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.JeUDF_5N1_SqECdZiuCMFg5PyeioSGHs7hY5U-SH-2I'};
  }
}
