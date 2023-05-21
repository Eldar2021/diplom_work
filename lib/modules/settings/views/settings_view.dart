import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_world/app/app.dart';
import 'package:learn_world/core/core.dart';
import 'package:learn_world/l10n/l10n.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final appCubit = context.watch<AppCubit>();
    return Scaffold(
      appBar: AppBar(
        key: const Key('settings-view'),
        title: Text(l10n.lang),
      ),
      body: ListView(
        children: [
          ListTile(
            key: const Key('settings-language-view'),
            title: const Text('l10n.profileLang'),
            subtitle: Text(appCubit.state.currentLocale.languageCode),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.pushNamed(context, AppRouter.language),
          ),
          ListTile(
            key: const Key('settings-theme-view'),
            title: const Text('l10n.profileTheme'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.pushNamed(context, AppRouter.theme),
          ),
          ListTile(
            key: const Key('settings-about-us-view'),
            title: const Text('l10n.aboutUs'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.pushNamed(context, AppRouter.aboutUs),
          ),
          ListTile(
            key: const Key('settings-feedback-view'),
            title: const Text('l10n.feedback'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () async => AppLaunch.sendEmail(
              'eldiiaralmazbekov@gmail.com',
              snackBarText: 'l10n.feedBackSms',
              context: context,
            ),
          ),
          ListTile(
            key: const Key('settings-developers-view'),
            title: const Text('l10n.profileForDevelopers'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.pushNamed(context, AppRouter.developers),
          ),
        ],
      ),
    );
  }
}
