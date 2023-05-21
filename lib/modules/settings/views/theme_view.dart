import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_world/app/app.dart';
import 'package:learn_world/l10n/l10n.dart';
import 'package:learn_world/theme/theme.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = context.watch<AppCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.themeinstallation),
        actions: [
          IconButton(
            key: const Key('settings-theme-theme-button'),
            onPressed: () {
              context.read<AppCubit>().changeThemeMode(
                    isDark: context.read<AppCubit>().state.theme.brightness == Brightness.light,
                  );
            },
            icon: appCubit.state.theme.brightness == Brightness.light
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        itemCount: targetColors.length,
        itemBuilder: (BuildContext context, int index) {
          final targetColor = targetColors[index];
          return Card(
            child: ListTile(
              leading: Icon(
                Icons.color_lens_rounded,
                color: targetColor,
              ),
              title: Text(targetColor?.value.toString() ?? ''),
              onTap: () => targetColor != null ? context.read<AppCubit>().changePrimaryColor(index, targetColor) : {},
            ),
          );
        },
      ),
    );
  }
}
