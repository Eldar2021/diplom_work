import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_world/app/app.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: context.read<AuthCubit>().logout,
          child: const Text('logout'),
        ),
      ),
    );
  }
}
