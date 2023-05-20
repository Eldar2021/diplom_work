import 'package:flutter/cupertino.dart';

import 'package:learn_world/models/models.dart';
import 'package:learn_world/modules/modules.dart';

class AppRouter {
  const AppRouter();

  static const String main = '/';
  static const String home = '/home';
  static const String login = '/login';

  static Route<void> onGenerateRoute(RouteSettings settings, User? user) {
    switch (settings.name) {
      case main:
        return CupertinoPageRoute(
          builder: (_) {
            if (user != null) return const HomeView();
            return const LoginView();
          },
        );
      case home:
        return CupertinoPageRoute(
          builder: (_) => const HomeView(),
          settings: settings,
        );
      case login:
        return CupertinoPageRoute(
          builder: (_) => const LoginView(),
          settings: settings,
        );

      default:
        throw Exception('no builder specified for route named: [${settings.name}]');
    }
  }
}
