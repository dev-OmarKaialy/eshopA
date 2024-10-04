import 'package:flutter/material.dart';

extension StringParser on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  Color toColor() {
    if (isNullOrEmpty) return Colors.transparent;
    String hashColor = this!.replaceAll('#', '0xff');
    return Color(int.parse(hashColor));
  }
}
