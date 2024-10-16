import 'package:eshop_a/core/helper/src/typedef.dart';

class BaseResponse<T> {
  final T result;
  final String errorMessage;
  final int errorCode;

  BaseResponse({
    required this.result,
    required this.errorMessage,
    required this.errorCode,
  });

  factory BaseResponse.fromJson({
    required BodyMap json,
    required DataConverter dataConverter,
  }) =>
      BaseResponse(
        result: dataConverter(json['result']),
        errorMessage: json['errorMessage'],
        errorCode: json['errorCode'],
      );
}
