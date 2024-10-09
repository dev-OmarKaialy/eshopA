import 'package:eshop_a/core/helper/src/typedef.dart';

class BaseResponse<T> {
  final bool status;
  final String message;
  final T result;

  BaseResponse({
    required this.status,
    required this.message,
    required this.result,
  });

  factory BaseResponse.fromJson({
    required BodyMap json,
    required DataConverter dataConverter,
  }) =>
      BaseResponse(
        status: json['status'],
        message: json['message'],
        result: dataConverter(json['data']),
      );
}
