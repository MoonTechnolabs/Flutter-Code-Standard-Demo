import 'package:dio/dio.dart';
import 'package:moon_flutter_getx_architecture/app/app_strings.dart';
import 'package:moon_flutter_getx_architecture/network/api_helpers/network_exception.dart';
import 'package:moon_flutter_getx_architecture/network/api_helpers/network_constants.dart';
import 'package:moon_flutter_getx_architecture/network/api_helpers/network_interceptor.dart';
import 'package:moon_flutter_getx_architecture/network/api_helpers/network_connectivity.dart';

class ApiProvider {
  // to check network connectivity
  static Future<bool> isNetworkAvailable = NetworkConnectivity().checkInternet();

  // Dio api client initialization
  static Dio dio = Dio(
    BaseOptions(
      responseType: ResponseType.json,
      baseUrl: NetworkConstants.baseUrl,
    ),
  )..interceptors.addAll([NetworkInterceptor()]);

  // common GET method to call any get API
  Future<dynamic> get({
    required String apiUrl,
    required Map<String, String> headers,
    Map<String, String>? query,
  }) async {
    dynamic responseJson;
    if (await isNetworkAvailable) {
      try {
        final response = await dio.get(apiUrl, options: Options(headers: headers));
        responseJson = response.data;
      } on DioError catch (e) {
        throw NetworkExceptions.fromDioError(e);
      }
      return responseJson;
    } else {
      throw AppStrings.noInternetConnection;
    }
  }

  // common POST method to call any post API
  Future<dynamic> post({
    required String apiUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    Map<String, String>? query,
  }) async {
    dynamic responseJson;
    if (await isNetworkAvailable) {
      try {
        final response = await dio.post(
          apiUrl,
          data: params,
          options: Options(
            headers: headers,
            extra: query,
          ),
        );
        responseJson = response.data;
      } on DioError catch (e) {
        throw NetworkExceptions.fromDioError(e);
      }
      return responseJson;
    } else {
      throw AppStrings.noInternetConnection;
    }
  }

  // common POST method to call any post API with Multipart data
  Future<dynamic> postMultipart({
    required String apiUrl,
    FormData? data,
    Map<String, String>? headers,
  }) async {
    dynamic responseJson;
    if (await isNetworkAvailable) {
      try {
        final response = await dio.post(apiUrl, data: data, options: Options(headers: headers));
        responseJson = response.data;
      } on DioError catch (e) {
        throw NetworkExceptions.fromDioError(e);
      }
      return responseJson;
    } else {
      throw AppStrings.noInternetConnection;
    }
  }

  // common DELETE method to call any delete API
  Future<dynamic> delete({
    required String apiUrl,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
  }) async {
    dynamic responseJson;
    if (await isNetworkAvailable) {
      try {
        final response = await dio.delete(
          apiUrl,
          options: Options(headers: headers, extra: query),
        );
        responseJson = response.data;
      } on DioError catch (e) {
        throw NetworkExceptions.fromDioError(e);
      }
      return responseJson;
    } else {
      throw AppStrings.noInternetConnection;
    }
  }

  // common PUT method to call any update API
  Future<dynamic> put({
    required String apiUrl,
    Map<String, String>? headers,
    required Map<String, dynamic> params,
    Map<String, String>? query,
  }) async {
    dynamic responseJson;
    if (await isNetworkAvailable) {
      try {
        final response = await dio.put(
          apiUrl,
          data: params,
          options: Options(
            headers: headers,
            extra: query,
          ),
        );
        responseJson = response.data;
      } on DioError catch (e) {
        throw NetworkExceptions.fromDioError(e);
      }
      return responseJson;
    } else {
      throw AppStrings.noInternetConnection;
    }
  }
}
