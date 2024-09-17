import '../../utils/type_defs.dart';

class BaseResponse<T> {
  final T? data;
  final String? errorMessage;
  final int? errorCode;

  BaseResponse({
    this.data,
    this.errorMessage,
    this.errorCode,
  });

  factory BaseResponse.fromJson({
    required BodyMap json,
    DataConverter? dataConverter,
  }) =>
      BaseResponse(
        data: dataConverter == null ? null : dataConverter(json["data"]),
        errorMessage: json["message"],
        errorCode: json["errorCode"],
      );
}
