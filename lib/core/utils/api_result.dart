abstract class ApiResult<T> {
  const ApiResult();

  static Future<ApiResult<R>> handleApi<R>(Future<R> Function() apiCall) async {
    try {
      final data = await apiCall();
      return ApiSuccess(data);
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
