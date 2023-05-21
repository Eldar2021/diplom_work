import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:learn_world/app/app.dart';
import 'package:learn_world/components/components.dart';
import 'package:learn_world/constants/constants.dart';
import 'package:learn_world/l10n/l10n.dart';
import 'package:learn_world/theme/theme.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.wellcome,
          style: context.titleLarge!.copyWith(
            color: context.colors.primary,
            fontSize: 36,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.user != null) {
            Navigator.pushNamedAndRemoveUntil<void>(context, AppRouter.mainHome, (route) => false);
          }
          if (state.error != null) {
            showAboutDialog(context: context);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.codelab.image(),
            const Spacer(),
            CustomButtonWithIcon(
              icon: Icon(FontAwesomeIcons.google, color: context.colors.primary),
              text: 'Google',
              onPressed: context.read<AuthCubit>().signInWithGoogle,
            ),
            const SizedBox(height: 20),
            Text(
              context.l10n.orloginwith,
              textAlign: TextAlign.center,
              style: context.bodyLarge!.copyWith(color: context.colors.shadow),
            ),
            const SizedBox(height: 20),
            CustomButtonWithIcon(
              icon: Icon(Icons.apple, color: context.colors.primary),
              text: 'Apple',
              onPressed: () {},
            ),
            const Spacer(),
            CustomButton(
              text: context.l10n.getWithoutAccount,
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil<void>(context, AppRouter.mainHome, (route) => false);
              },
            ),
            const Spacer(),
            Text(
              context.l10n.privicy,
              style: context.bodyLarge!.copyWith(
                color: context.colors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
