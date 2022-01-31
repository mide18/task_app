import 'package:task_manager_app/core/models/error_model/error_response_model.dart';

class AppException implements Exception {
  final ErrorResponseModel error;
  final prefix;

  AppException({required this.error, required this.prefix});
}

// 401: unauthorizedException

// 419: token mismatch (unauthorizedException)

//500 internal server error

class Forbidden extends AppException {
  Forbidden(ErrorResponseModel error) : super(prefix: "Forbidden", error: error);
}

class UnAuthorisedException extends AppException {
  UnAuthorisedException(ErrorResponseModel error)
      : super(prefix: "UnAuthorized", error: error);
}

class TokenMismatchException extends AppException {
  TokenMismatchException(ErrorResponseModel error)
      : super(prefix: "Token mismatch ", error: error);
}

class ServerError extends AppException {
  ServerError(ErrorResponseModel error) : super(prefix: "Server error", error: error);
}

class FetchDataException extends AppException {
  FetchDataException(ErrorResponseModel error)
      : super(prefix: "Fetch Data Exception", error: error);
}

class UnProcessableEntity extends AppException {
  UnProcessableEntity(ErrorResponseModel error)
      : super(prefix: "UnProcessable Entity", error: error);
}


