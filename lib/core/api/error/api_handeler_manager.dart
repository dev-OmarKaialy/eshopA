import 'package:dio/dio.dart';
import 'package:eshop_a/core/helper/src/typedef.dart';

import 'error_handeler.dart';
import 'failure.dart';

mixin HandlingApiManager {
  Future<T> wrapHandlingApi<T>({required Future<Response> Function() tryCall, required DataConverter<T> jsonConvert}) async {
    try {
      final response = await tryCall();
      if (response.statusCode == ResponseCode.SUCCESS) {
        return jsonConvert(response.data);
      } else {
        throw ServerFailure(
          message: response.data['message'].toString(),
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
