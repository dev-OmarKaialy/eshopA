import 'package:flutter/material.dart';

class AppLocalization {
  const AppLocalization._();

  static const arLocale = Locale('ar', 'SY');
  static const enLocale = Locale('en', 'US');

  static List<Locale> get supportedLocales => [enLocale, arLocale];

  static Locale get fallbackLocale => enLocale;
}
