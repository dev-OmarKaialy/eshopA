import 'package:easy_localization/easy_localization.dart';

class AppValidator {
  const AppValidator._();

  static String? required(String? value) {
    if ((value ?? '').isEmpty) return 'fieldRequired'.tr();
    return null;
  }
}
