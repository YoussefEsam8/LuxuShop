import 'package:dio/dio.dart';

class DioFactory {
  Dio setupDio() {
    Dio dio = Dio();
    dio
      ..options.receiveTimeout = Duration(seconds: 20)
      ..options.connectTimeout = Duration(seconds: 20);
    dio.interceptors.add(
      LogInterceptor(
        requestUrl: true,
        error: true,
        request: true,
        responseUrl: false,
        requestBody: true,
      ),
    );
    return dio;
  }
}
