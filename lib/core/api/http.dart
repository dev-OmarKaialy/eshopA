import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../utils/type_defs.dart';
import '../extensions/colorful_logging_extension.dart';
import '../services/device_info_service.dart';
import 'request_exceptions_handler.dart';

class Http with RequestExceptionsHandler {
  const Http._();

  static Future<String> get({
    required Uri uri,
    BodyMap body = const {},
    bool sendDeviceId = false,
  }) async =>
      RequestExceptionsHandler.tryCallRequest(
        'GET',
        uri: uri,
        body: body,
        sendDeviceId: sendDeviceId,
      );

  static Future<String> post({
    required Uri uri,
    BodyMap body = const {},
    bool sendDeviceId = false,
  }) async =>
      RequestExceptionsHandler.tryCallRequest(
        'POST',
        uri: uri,
        body: body,
        sendDeviceId: sendDeviceId,
      );

  static Future<String> put({
    required Uri uri,
    BodyMap body = const {},
    bool sendDeviceId = false,
  }) async =>
      RequestExceptionsHandler.tryCallRequest(
        'PUT',
        uri: uri,
        body: body,
        sendDeviceId: sendDeviceId,
      );

  static Future<String> delete({
    required Uri uri,
  }) async =>
      RequestExceptionsHandler.tryCallRequest(
        'DELETE',
        uri: uri,
      );

  static Future<String> postFormData({
    required Uri uri,
    BodyMap body = const {},
    bool sendDeviceId = false,
  }) async =>
      RequestExceptionsHandler.handelExceptions(
        method: 'post form-data',
        function: () async {
          final Map<String, String> headers = {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          };

          http.MultipartRequest request = http.MultipartRequest('POST', uri);
          request.headers.addAll(headers);

          for (var item in body.entries) {
            if (item.value is File) {
              request.files.add(
                  await http.MultipartFile.fromPath(item.key, item.value.path));
            } else {
              request.fields[item.key] = item.value.toString();
            }
          }

          if (sendDeviceId) {
            final deviceId = await DeviceInfoService.getDeviceId();
            request.fields['DeviceId'] = deviceId;
          }

          http.StreamedResponse streamedResponse =
              await request.send().timeout(const Duration(seconds: 20));
          http.Response response =
              await http.Response.fromStream(streamedResponse);
          log(jsonEncode(body).logGreen, name: "request body");
          log(response.body.logGreen, name: "response body");
          log(response.statusCode.toString().logGreen, name: "status code");
          if (response.statusCode == 200) {
            return response.body;
          } else {
            Exception exception =
                RequestExceptionsHandler.getException(response: response);
            throw exception;
          }
        },
      );
}
