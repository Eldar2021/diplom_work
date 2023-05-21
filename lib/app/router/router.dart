import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_world/core/core.dart';

import 'package:learn_world/models/models.dart';
import 'package:learn_world/modules/modules.dart';

class AppRouter {
  const AppRouter();

  static const String main = '/';
  static const String mainHome = '/main-home';
  static const String home = '/home';
  static const String homeDetail = '/home-detail';
  static const String login = '/login';
  static const String settingsView = '/settings';
  static const String profile = '/profile';
  static const String language = '/language';
  static const String theme = '/theme';
  static const String developers = '/developers';
  static const String aboutUs = '/about-us';
  static const String chat = '/chat';

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
      case homeDetail:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                DetailCubit(context.read<ApiService>(), (settings.arguments as String?) ?? '')..getData(),
            child: const HomeDetailView(),
          ),
        );
      case login:
        return CupertinoPageRoute(builder: (_) => const LoginView());
      case settingsView:
        return CupertinoPageRoute(builder: (_) => const SettingsView());
      case language:
        return CupertinoPageRoute(builder: (_) => const LanguageView());
      case theme:
        return CupertinoPageRoute(builder: (_) => const ThemeView());
      case developers:
        return CupertinoPageRoute(builder: (_) => const DevelopersView());
      case aboutUs:
        return CupertinoPageRoute(builder: (_) => const AboutUsVuew());
      case chat:
        return CupertinoPageRoute(builder: (_) => const ChatView());
      default:
        throw Exception('no builder specified for route named: [${settings.name}]');
    }
  }
}
