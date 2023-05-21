import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_world/app/app.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: context.read<AuthCubit>().signInWithGoogle,
                child: const Text('Google'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil<void>(context, AppRouter.mainHome, (route) => false);
                },
                child: const Text('Get Without any account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
