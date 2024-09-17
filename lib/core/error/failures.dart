abstract class Failure {
  final String message;
  final int? code;

  const Failure({required this.message, this.code});

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure({
    String? message,
    int? code,
  }) : super(message: message ?? "ServerFailure", code: code);
}

class OperationFailedFailure extends Failure {
  const OperationFailedFailure({
    String? message,
    int? code,
  }) : super(message: message ?? "OperationFailedFailure", code: code);
}

class HttpFailure extends Failure {
  const HttpFailure({
    String? message,
    int? code,
  }) : super(message: message ?? "HttpFailure", code: code);
}
