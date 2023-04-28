import 'package:dio/dio.dart';
import 'package:moon_flutter_getx_architecture/utils/utils.dart';

class NetworkInterceptor extends Interceptor {
  // will be called whenever interaction with any API requested
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Utils.customLog("----- REQUEST -----");
    Utils.customLog('Method => ${options.method}');
    Utils.customLog(
        'Request => ${options.baseUrl}${options.path} => ${options.data ?? options.queryParameters}');
    Utils.customLog('Header => ${options.headers}');
    Utils.customLog("-----------------");
    return super.onRequest(options, handler);
  }

  // will be called whenever gets the response of any API
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Utils.customLog('----- RESPONSE -----');
    Utils.customLog(
        'Response => URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    Utils.customLog('Response => StatusCode: ${response.statusCode}');
    Utils.customLog('Response => Body: ${response.data}');
    Utils.customLog("-----------------");
    return super.onResponse(response, handler);
  }

  // will be called whenever gets the error in any API
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Utils.customLog('----- ERROR -----');
    Utils.customLog(
      'Error Status : ${err.response?.statusCode} : ${err.response?.statusMessage} : '
      '${err.requestOptions.baseUrl}${err.requestOptions.path}',
    );
    Utils.customLog("-----------------");
    return super.onError(err, handler);
  }
}
