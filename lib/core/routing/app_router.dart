import 'package:flutter/material.dart';

import '../../features/home/presentation/pages/home_page.dart';
import 'app_route_string.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNamePage.homePage:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return null;
    }
  }
}
