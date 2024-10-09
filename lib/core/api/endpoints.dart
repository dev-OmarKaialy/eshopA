import 'dart:developer';

import 'package:eshop_a/core/extensions/colorful_logging_extension.dart';
import 'package:eshop_a/core/helper/src/typedef.dart';

class Endpoints {
  Endpoints._();
  static const _scheme = 'https';
  static const _host = '127.0.0.1';
  static const _port = 8000;

  static Uri _mainUri({
    required String path,
    QueryParams? queryParameters,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      port: _port,
      path: '/api/$path',
      queryParameters: queryParameters,
    );
    log(uri.toString().logMagenta);
    return uri;
  }

  //////!Auth!//////
  static Uri _auth({required String path}) => _mainUri(path: 'auth/$path');
  static Uri login() => _auth(path: 'login');
  static Uri register() => _auth(path: 'register');
}
