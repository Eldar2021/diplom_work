import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_world/app/app.dart';
import 'package:learn_world/core/core.dart';
import 'package:learn_world/l10n/l10n.dart';
import 'package:learn_world/modules/modules.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit(context.read<AppService>())),
        BlocProvider(create: (context) => AuthCubit(context.read<AuthService>())),
        BlocProvider(create: (context) => HomeCubit(context.read<ApiService>())),
      ],
      child: const MetaApp(),
    );
  }
}

class MetaApp extends StatelessWidget {
  const MetaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = context.watch<AppCubit>();
    return MaterialApp(
      title: 'Learn World',
      debugShowCheckedModeBanner: false,
      locale: appCubit.state.currentLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: appCubit.state.theme.themeData,
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(
        settings,
        context.read<AuthCubit>().state.user,
      ),
    );
  }
}
