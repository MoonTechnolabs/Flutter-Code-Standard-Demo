import 'package:dio/dio.dart';

class NetworkExceptions implements Exception {
  late String message;

  @override
  String toString() => message;

  NetworkExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = 'Cancel Request';
        break;
      case DioErrorType.connectionTimeout:
        message = 'Connection Error';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Receive Timeout';
        break;
      case DioErrorType.badResponse:
        message = _handleError(dioError.response?.statusCode, dioError.response?.data);
        break;
      case DioErrorType.sendTimeout:
        message = 'Send Timeout';
        break;
      case DioErrorType.unknown:
        if ((dioError.message ?? '').contains('Socket')) {
          message = 'Socket Exception';
          break;
        }
        message = 'Unexpected Error';
        break;
      default:
        message = 'Unknown Error';
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad Request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      case 422:
        return 'Duplicate Email';
      case 500:
        return 'Internal Server Error';
      case 502:
        return 'Bad Gateway';
      default:
        return 'Unknown Error';
    }
  }
}
