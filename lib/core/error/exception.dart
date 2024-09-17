class ServerException implements Exception {
  final String? message;
  final int? statusCode;
  ServerException({
    this.message = "ServerException",
    this.statusCode,
  });

  @override
  String toString() => 'ServerException(message: $message, statusCode: $statusCode)';
}

class OperationFailedException implements Exception {
  final String? message;
  final int? statusCode;

  OperationFailedException({
    this.message = "OperationFailedException",
    this.statusCode,
  });

  @override
  String toString() => 'OperationFailedException(message: $message, statusCode: $statusCode)';
}
