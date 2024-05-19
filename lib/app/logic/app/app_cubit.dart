import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learn_world/core/core.dart';
import 'package:learn_world/theme/theme.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(this.appService) : super(AppState(appService.init.$1, appService.init.$2));

  final AppService appService;

  Future<void> changeLocale(String langKey) async {
    await appService.setLocale(langKey);
    emit(state.copyWith(currentLocale: Locale(langKey)));
  }

  Future<void> changePrimaryColor(int colorIndex, Color color) async {
    await appService.setPrimaryColor(colorIndex);
    emit(state.copyWith(theme: state.theme.copyWith(targetColor: color)));
  }

  Future<void> changeThemeMode({required bool isDark}) async {
    await appService.setThemeMode(isDark: isDark);
    emit(state.copyWith(theme: state.theme.copyWith(brightness: isDark ? Brightness.dark : Brightness.light)));
  }
}
