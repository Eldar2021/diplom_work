import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:diplom_work/app/app.dart';
import 'package:diplom_work/theme/theme_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (ctx) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}
