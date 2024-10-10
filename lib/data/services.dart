import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final Dio dio;
  Api(this.dio);

  void setUpInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options,
            RequestInterceptorHandler requestInterceptorHandler) {
          "======================================================================>";
          debugPrint("REQUEST HEADERS ==============>  ${options.headers}");
          debugPrint("REQUEST URI ==============>  ${options.uri}");
          debugPrint("REQUEST DATA ==============>  ${options.data}");
          "======================================================================>";
          return requestInterceptorHandler.next(options); //continue
        },
        onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
          "======================================================================>";
          debugPrint("RESPONSE DATA ==============>  ${response.data}");
          debugPrint("RESPONSE HEADERS ==============>  ${response.headers}");
          debugPrint(
              "RESPONSE STATUSCODE ==============>  ${response.statusCode}");
          debugPrint(
              "RESPONSE STATUSMESSAGE ==============>  ${response.statusMessage}");
          "======================================================================>";
          return handler.next(response); // continue
        },
        onError: (DioException e, handler) {
          debugPrint("RESPONSE ERROR ==============>  ${e.type}");
          debugPrint("RESPONSE ERROR ==============>  ${e.message}");
          return handler.next(e); //continue
        },
      ),
    );
  }
}
