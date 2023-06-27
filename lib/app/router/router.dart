import 'package:flutter/cupertino.dart';

import 'package:learn_world/models/models.dart';
import 'package:learn_world/modules/modules.dart';

class AppRouter {
  const AppRouter._();

  static const main = '/';
  static const mainHome = '/main-home';
  static const home = '/home';
  static const login = '/login';
  static const settingsView = '/settings';
  static const profile = '/profile';
  static const language = '/language';
  static const theme = '/theme';
  static const developers = '/developers';
  static const aboutUs = '/about-us';
  static const topics = '/topics';

  static Route<void> onGenerateRoute(RouteSettings settings, User? user) {
    return switch (settings.name) {
      main => CupertinoPageRoute(builder: (_) => user != null ? const MainView() : const LoginView()),
      mainHome => CupertinoPageRoute(builder: (_) => const MainView()),
      home => CupertinoPageRoute(builder: (_) => const HomeView()),
      login => CupertinoPageRoute(builder: (_) => const LoginView()),
      settingsView => CupertinoPageRoute(builder: (_) => const SettingsView()),
      language => CupertinoPageRoute(builder: (_) => const LanguageView()),
      theme => CupertinoPageRoute(builder: (_) => const ThemeView()),
      developers => CupertinoPageRoute(builder: (_) => const DevelopersView()),
      aboutUs => CupertinoPageRoute(builder: (_) => const AboutUsVuew()),
      topics => CupertinoPageRoute(builder: (_) => const TopicsView()),
      _ => throw Exception('No builder specified for route named: [${settings.name}]'),
    };
  }
}
