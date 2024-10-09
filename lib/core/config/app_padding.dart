import 'package:flutter/material.dart';

class AppPadding {
  AppPadding._();

  static const EdgeInsetsGeometry def = EdgeInsets.all(8);
  static const EdgeInsetsGeometry zero = EdgeInsets.zero;
  static const EdgeInsetsGeometry tiny = EdgeInsets.all(2);
  static const EdgeInsetsGeometry small = EdgeInsets.all(4);
  static const EdgeInsetsGeometry pagePadding = EdgeInsets.all(20);
  static const EdgeInsetsGeometry bottomSheetPadding = EdgeInsets.symmetric(vertical: 0, horizontal: 25);
  static const EdgeInsetsGeometry listViewPadding = EdgeInsets.only(top: 20, left: 20, right: 20);
  static const EdgeInsetsGeometry notificationPadding = EdgeInsets.all(10);
  static const EdgeInsetsGeometry dialogPadding = EdgeInsets.all(20.0);
  static const EdgeInsetsGeometry cardPadding = EdgeInsets.symmetric(horizontal: 20.0, vertical: 10);
}
