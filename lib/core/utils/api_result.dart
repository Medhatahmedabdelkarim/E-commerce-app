import 'dart:math';

import 'package:dio/dio.dart';

abstract class ApiResult<T> {
  const ApiResult();

  static Future<ApiResult<R>> handleApi<R>(Future<R> Function() apiCall) async {
    try {
      final data = await apiCall();
      return ApiSuccess(data);
    } on DioException catch (e) {
      print(e);
            String message = "An unknown error occurred";
      final statusCode = e.response?.statusCode;
      //status codes taken from the back-end team
      if (statusCode != null) {
        switch (statusCode) {
          case 400:
            message = "Bad request. Please check your input.";
            break;
          case 401:
            message = "Unauthorized. Please log in again.";
            break;
          case 403:
            message = "Forbidden. You don’t have permission.";
            break;
          default:
            message = "Unexpected error (code: $statusCode)";
        }
      } else {
        if (e.type == DioExceptionType.connectionTimeout ||
            e.type == DioExceptionType.sendTimeout ||
            e.type == DioExceptionType.receiveTimeout) {
          message = "Connection timeout. Please check your internet.";
        }  else if (e.type == DioExceptionType.badResponse) {
          message = "Received an invalid response from the server.";
        }
      }

      return ApiError(message);
    } catch (e) {
      return ApiError(e.toString());
    }
  }
}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;

  const ApiSuccess(this.data);
}

class ApiError<T> extends ApiResult<T> {
  final String message;

  const ApiError(this.message);
}
