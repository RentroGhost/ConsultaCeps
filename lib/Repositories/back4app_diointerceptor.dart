import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Back4AppDioInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //options.headers["X-Parse-Application-Id"] = dotenv.get("BACK4APPAPPLICATIONID");
    //options.headers["X-Parse-REST-API-Key"] = dotenv.get("BACK4APPRESTAPIKEY");
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) async {
    print('ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}');
    super.onError(error, handler);
  }
}