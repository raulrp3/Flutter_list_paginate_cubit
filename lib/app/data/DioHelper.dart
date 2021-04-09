import 'package:dio/dio.dart';

class DioHelper {
  static Dio build(String baseUrl) {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
    );

    Dio dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioError error, handler) {
        return handler.next(error);
      },
    ));

    return dio;
  }
}
