import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_world/app/cubit/auth_cubit.dart';

class SpalshView extends StatelessWidget {
  const SpalshView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.read<AuthCubit>().signInWithGoogle();
        },
      ),
      appBar: AppBar(
        title: const Text('SpalshView'),
      ),
    );
  }
}
