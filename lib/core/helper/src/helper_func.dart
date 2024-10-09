import 'dart:io';

import 'package:flutter/cupertino.dart';

class HelperFunc {
  // static final SharedPreferences _pref = getIt<SharedPreferences>();
  // static bool isAuth() => _pref.containsKey(PrefsKeys.userInfo);

  // static void logout() {
  //   _pref.remove(PrefsKeys.userInfo);
  //   _pref.remove(PrefsKeys.currentCountry);
  //   getIt<ApiClient>().resetHeader();
  // }

  static bool isPhone(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide < 550 ? true : false;
  }

  static bool get isPlatformDesktop => Platform.isLinux || Platform.isMacOS || Platform.isWindows;
}

extension MediaQuerySize on BuildContext {
  Size get sz => MediaQuery.of(this).size;
}
