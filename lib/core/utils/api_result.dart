import 'package:dummy_project/core/utils/api_exception.dart';


class ApiResult<T> {
  final T? data;
  final AppException? error;

  ApiResult.success(this.data) : error = null;
  ApiResult.failure(this.error) : data = null;

  bool get isSuccess => data != null;
}