import 'package:eshop_a/core/config/app_padding.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: _lightColorScheme,
        textTheme: _textTheme,
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: _lightColorScheme.surfaceBright,
        inputDecorationTheme: _inputDecorationTheme(_lightColorScheme),
        checkboxTheme: _checkboxTheme(_lightColorScheme),
      );

  static TextTheme get _textTheme => TextTheme(
        displayLarge: TextStyle(fontSize: 56, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
        displayMedium: TextStyle(fontSize: 46, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
        displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
        headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis),
        headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis),
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, overflow: TextOverflow.ellipsis),
        titleMedium: TextStyle(fontSize: 19, fontWeight: FontWeight.w800, overflow: TextOverflow.ellipsis),
        titleSmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, overflow: TextOverflow.ellipsis),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, overflow: TextOverflow.ellipsis),
        labelLarge: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis),
        labelMedium: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis),
        labelSmall: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, overflow: TextOverflow.ellipsis),
      );

  static ColorScheme get _lightColorScheme => ColorScheme(
        brightness: Brightness.light,
        primary: Colors.blue,
        onPrimary: Colors.white,
        secondary: Colors.green,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.grey,
        onSurface: Colors.black,
      );

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
    border(Color color) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: color, width: 2),
        );

    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surface.withOpacity(0.1),
      focusColor: colorScheme.primary,
      border: border(colorScheme.onSurface),
      enabledBorder: border(colorScheme.primary),
      errorBorder: border(colorScheme.error),
      labelStyle: _textTheme.bodySmall?.copyWith(color: colorScheme.primary),
      hintStyle: _textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface.withOpacity(0.5)),
      floatingLabelAlignment: FloatingLabelAlignment.start,
      contentPadding: AppPadding.def,
    );
  }

  static CheckboxThemeData _checkboxTheme(ColorScheme colorScheme) {
    return CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(colorScheme.onTertiary),
      shape: const CircleBorder(),
      side: const BorderSide(width: .5),
    );
  }
}
