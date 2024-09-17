import 'dart:developer';

import '../utils/type_defs.dart';
import '../extensions/colorful_logging_extension.dart';

class EndPoints {
  const EndPoints._();

  ////////////!      General      !////////////
  static const _scheme = 'https';
  static const _host = 'medusyria.com';

  static Uri _mainUri({
    required String path,
    ParamsMap params,
  }) {
    final uri = Uri(
      scheme: _scheme,
      host: _host,
      path: 'api/$path',
      queryParameters: params,
    );
    log(uri.toString().logMagenta);
    return uri;
  }

  static Uri decrypt({ParamsMap params}) =>
      _mainUri(path: 'decrypt', params: params);

  ////////////!        auth        !////////////
  static Uri _auth({required String path, ParamsMap params}) =>
      _mainUri(path: 'auth/$path', params: params);
  static Uri logIn({ParamsMap params}) =>
      _auth(path: 'clientLogin', params: params);
  static Uri signUp({ParamsMap params}) =>
      _auth(path: 'signup', params: params);

  ////////////!        subscription        !////////////
  static Uri _subscription({required String path, ParamsMap params}) =>
      _mainUri(path: 'subscription/$path', params: params);
  static Uri activateCode({ParamsMap params}) =>
      _subscription(path: 'active', params: params);

  ////////////!     units    !////////////
  static Uri getUnits({ParamsMap params}) =>
      _mainUri(path: 'guest/unit', params: params);

  ////////////!     subjects   !////////////
  static Uri getSubjects({required int unitId, ParamsMap params}) =>
      _mainUri(path: 'guest/unit/$unitId', params: params);

  ////////////!     sections    !////////////
  static Uri getSections({required int subjectId, ParamsMap params}) =>
      _mainUri(
        path: 'guest/subject/$subjectId',
        params: params,
      );

  ////////////!     records    !////////////
  static Uri getSecuredRecords({ParamsMap params, required int id}) =>
      _mainUri(path: 'guest/section/$id', params: params);
  static Uri getRecords({ParamsMap params, required int sectionId}) =>
      _mainUri(path: 'section/$sectionId', params: params);
}
