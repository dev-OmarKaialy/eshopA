import 'package:flutter/material.dart';

extension RoutingExt on BuildContext {
  String? get currentRouteName => ModalRoute.of(this)?.settings.name;

  bool isCurrentRoute(String routeName) => currentRouteName == routeName;

  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop<T>(result);

  void popUntil(List<String> routeNames) {
    Navigator.of(this).popUntil((route) => routeNames.contains(route.settings.name));
  }

  pushReplacementNamed(String name, {Object? extra}) {
    Navigator.of(this).pushReplacementNamed(
      name,
      arguments: extra,
    );
  }

  Future<R?> pushNamed<R>(String routeName, {Object? extra}) => Navigator.of(this).pushNamed<R>(routeName, arguments: extra);

  goNamed<R>(String name, {Object? extra}) => Navigator.of(this).pushNamedAndRemoveUntil<R>(name, (route) => false, arguments: extra);

  pushNamedAndRemoveUntil<R>(String name, {required String untilName, Object? extra}) {
    Navigator.of(this).pushNamedAndRemoveUntil<R>(
      name,
      arguments: extra,
      (route) => untilName == route.settings.name,
    );
  }
}
