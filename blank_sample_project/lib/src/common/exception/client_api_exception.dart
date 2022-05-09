/// Base class for application exceptions
abstract class ClientApiException implements Exception {
  final _error;
  final _prefix;

  ClientApiException([this._error, this._prefix]);

  Map<String, dynamic>? toMap() {
    return {
      "error": "$_prefix - $_error",
      "object": _error,
    };
  }
}

/// Default HTTP exception for undefined status error
class FetchDataException extends ClientApiException {
  FetchDataException(error)
      : super(error, "[ERROR] Error During Communication: ");
}

/// HTTP exception for error status 400
class BadRequestException extends ClientApiException {
  BadRequestException(error) : super(error, "[ERROR] Invalid Request: ");
}

/// HTTP exception for error status 401
class UnauthorizedException extends ClientApiException {
  UnauthorizedException(error) : super(error, "[ERROR] Unauthorized: ");
}

/// HTTP exception for error status 403
class ForbiddenException extends ClientApiException {
  ForbiddenException(error) : super(error, "[ERROR] Forbidden: ");
}

/// Exception for wrong input in forms
class InvalidInputException extends ClientApiException {
  InvalidInputException(error) : super(error, "[ERROR] Invalid Input: ");
}

/// HTTP exception for error status 504 and request timeout
class TimeoutException extends ClientApiException {
  TimeoutException(error) : super(error, "[ERROR] Connection Timeout: ");
}

/// HTTP exception for error status 503
class ServiceUnavailableException extends ClientApiException {
  ServiceUnavailableException(error)
      : super(error, "[ERROR] Service Unavailable : ");
}

/// HTTP exception for error status 404 & 204
class NotFoundException extends ClientApiException {
  NotFoundException(error) : super(error, "[ERROR] Not Found: ");
}

/// HTTP exception for error status 500
class InternalServerErrorException extends ClientApiException {
  InternalServerErrorException(error)
      : super(error, "[ERROR] Internal Server Error: ");
}
