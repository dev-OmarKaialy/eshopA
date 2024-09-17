import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../text_theme.dart';
import 'dark_scheme.dart';

ThemeData get darkTheme {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: textTheme,
    colorScheme: darkColorScheme,
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: darkColorScheme.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkSurfaceContainer,
      ),
    ),
  );
}
