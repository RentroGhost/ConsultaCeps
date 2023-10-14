import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:viacepdesafio/Repositories/back4app_diointerceptor.dart';

class Back4AppCustomDio {

  final _dio = Dio();

  Dio get dio => _dio;

  Back4AppCustomDio() {

    _dio.options.headers["X-Parse-Application-Id"] = dotenv.get("BACK4APPAPPLICATIONID");
    _dio.options.headers["X-Parse-REST-API-Key"] = dotenv.get("BACK4APPRESTAPIKEY");
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = dotenv.get("BACK4APPURL");
    // _dio.interceptors.add(Back4AppDioInterceptor());
    // _dio.options.headers["Content-Type"] = "application/json";
    // _dio.options.baseUrl = dotenv.get("BACK4APPURL");
    // _dio.interceptors.add(Back4AppDioInterceptor());

  }


}