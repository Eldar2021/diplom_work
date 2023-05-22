import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_world/app/app.dart';
import 'package:learn_world/core/core.dart';
import 'package:learn_world/l10n/l10n.dart';
import 'package:learn_world/theme/theme.dart';
import 'package:learn_world/utils/utils.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = context.watch<AppCubit>();
    final authCubit = context.watch<AuthCubit>();
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          titleTextStyle: context.titleLarge,
          title: Text(
            authCubit.state.isAuthenticated ? authCubit.state.user?.displayName ?? context.l10n.hi : context.l10n.hello,
          ),
          subtitle: Text(authCubit.state.user?.email ?? ''),
          trailing: CircleAvatar(
            backgroundImage:
                authCubit.state.user?.photoUrl != null ? NetworkImage(authCubit.state.user!.photoUrl!) : null,
            child: authCubit.state.user?.photoUrl == null ? Text(authCubit.state.user?.displayName?[0] ?? '') : null,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(14, 20, 14, 40),
        children: [
          Card(
            child: ListTile(
              title: Text(context.l10n.language),
              subtitle: Text(appCubit.state.currentLocale.languageCode),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.pushNamed(context, AppRouter.language),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(context.l10n.theme),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.pushNamed(context, AppRouter.theme),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(context.l10n.aboutUs),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.pushNamed(context, AppRouter.aboutUs),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(context.l10n.contactUs),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () async => AppLaunch.sendEmail(
                'eldiiaralmazbekov@gmail.com',
                snackBarText: context.l10n.hello,
                context: context,
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(context.l10n.forDevelopers),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.pushNamed(context, AppRouter.developers),
            ),
          ),
          if (authCubit.state.isAuthenticated)
            Card(
              child: ListTile(
                title: Text(context.l10n.signout),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  AppAlert.showConfirmDialog<void>(
                    title: Text(context.l10n.areYouSure),
                    content: Text(context.l10n.signoutConfirm),
                    context: context,
                    onOK: () async {
                      Navigator.pop(context);
                      unawaited(AppAlert.showLoading(context));
                      await context.read<AuthCubit>().logout();
                      if (context.mounted) {
                        await Navigator.pushNamedAndRemoveUntil<void>(context, AppRouter.login, (route) => false);
                      }
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
