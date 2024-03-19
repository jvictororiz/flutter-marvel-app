import 'package:auto_injector/src/auto_injector_base.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptor/token_interceptor.dart';

class ApiConfiguration {
  final Injector i;


  ApiConfiguration(this.i);

  Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(TokenInterceptor(i()));
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));

    return dio;
  }
}
