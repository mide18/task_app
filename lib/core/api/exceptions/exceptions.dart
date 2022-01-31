import 'package:ecommerce_app/core/models/api/error_model/error_response_model.dart';


class AppException implements Exception {
  final ErrorModel error;
  final prefix;

  AppException({required this.error, required this.prefix});
}

// 401: unauthorizedException

// 419: token mismatch (unauthorizedException)

//500 internal server error

class Forbidden extends AppException {
  Forbidden(ErrorModel error) : super(prefix: "Forbidden", error: error);
}

class UnAuthorisedException extends AppException {
  UnAuthorisedException(ErrorModel error)
      : super(prefix: "UnAuthorized", error: error);
}

class TokenMismatchException extends AppException {
  TokenMismatchException(ErrorModel error)
      : super(prefix: "Token mismatch ", error: error);
}

class ServerError extends AppException {
  ServerError(ErrorModel error) : super(prefix: "Server error", error: error);
}

class FetchDataException extends AppException {
  FetchDataException(ErrorModel error)
      : super(prefix: "Fetch Data Exception", error: error);
}

class UnProcessableEntity extends AppException {
  UnProcessableEntity(ErrorModel error)
      : super(prefix: "UnProcessable Entity", error: error);
}


