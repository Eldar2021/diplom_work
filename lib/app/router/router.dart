import 'package:flutter/cupertino.dart';

import 'package:learn_world/models/models.dart';
import 'package:learn_world/modules/modules.dart';

class AppRouter {
  const AppRouter();

  static const String main = '/';
  static const String mainHome = '/main-home';
  static const String home = '/home';
  static const String login = '/login';
  static const String profile = '/profile';

  static Route<void> onGenerateRoute(RouteSettings settings, User? user) {
    switch (settings.name) {
      case main:
        return CupertinoPageRoute(
          builder: (_) {
            if (user != null) return const MainView();
            return const LoginView();
          },
        );
      case mainHome:
        return CupertinoPageRoute(builder: (_) => const MainView());
      case home:
        return CupertinoPageRoute(builder: (_) => const HomeView());
      case login:
        return CupertinoPageRoute(builder: (_) => const LoginView());
      case profile:
        return CupertinoPageRoute(builder: (_) => const ProfileView());
      default:
        throw Exception('no builder specified for route named: [${settings.name}]');
    }
  }
}
