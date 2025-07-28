class AppException {
  final String message;

  AppException(this.message);

  factory AppException.networkError() => AppException("Network Error");
  factory AppException.serverError() => AppException("Server Error");
  factory AppException.unauthorized() => AppException("Unauthorized");
  factory AppException.unknown() => AppException("Unknown Error");
}