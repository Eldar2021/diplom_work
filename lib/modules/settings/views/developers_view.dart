import 'package:flutter/material.dart';

import 'package:learn_world/components/components.dart';
import 'package:learn_world/constants/constants.dart';
import 'package:learn_world/core/core.dart';
import 'package:learn_world/l10n/l10n.dart';

class DevelopersView extends StatelessWidget {
  const DevelopersView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.forDevelopers),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        child: Column(
          children: [
            Text(
              context.l10n.forDevelopers,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Text(
              textAlign: TextAlign.justify,
              context.l10n.forDevelopersBody,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            CustomButtonWithIcon(
              onPressed: () => AppLaunch.launchURL(ApiConst.urlGitHub),
              text: 'GitHub',
              icon: Assets.icons.github.svg(
                height: 35,
                colorFilter: ColorFilter.mode(colorScheme.onBackground, BlendMode.srcIn),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
