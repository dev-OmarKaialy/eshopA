import 'package:flutter/material.dart';

extension Gradients on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  double get bottomViewInsets => MediaQuery.of(this).viewInsets.bottom;

  LinearGradient get primaryLinear => LinearGradient(
        colors: [Theme.of(this).primaryColor, Theme.of(this).primaryColor.withOpacity(.5)],
      );

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
