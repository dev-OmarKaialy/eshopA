import 'dart:io';

import 'package:eshop_a/core/api/dio/api_client.dart';
import 'package:eshop_a/core/di/di_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper.dart';

class HelperFunc {
  static final SharedPreferences _pref = getIt<SharedPreferences>();
  static bool isAuth() => _pref.containsKey(PrefsKeys.userInfo);

  static void logout() {
    _pref.remove(PrefsKeys.userInfo);
    _pref.remove(PrefsKeys.currentCountry);
    getIt<ApiClient>().resetHeader();
  }

  static bool isPhone(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide < 550 ? true : false;
  }

  static bool get isPlatformDesktop => Platform.isLinux || Platform.isMacOS || Platform.isWindows;
}

extension MediaQuerySize on BuildContext {
  Size get sz => MediaQuery.of(this).size;
}
