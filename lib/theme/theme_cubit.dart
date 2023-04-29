import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final defautTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: const Color(0xff6750a4),
);

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(defautTheme);

  bool m3 = true;
  Brightness br = Brightness.light;
  Color color = const Color(0xff6750a4);

  void changeColor(Color val) {
    color = val;
    emit(ThemeData(useMaterial3: m3, colorSchemeSeed: color, brightness: br));
  }

  void changeBr(Brightness brightness) {
    br = brightness;
    emit(ThemeData(useMaterial3: m3, colorSchemeSeed: color, brightness: br));
  }

  void changeM3({required bool val}) {
    m3 = val;
    emit(ThemeData(useMaterial3: m3, colorSchemeSeed: color, brightness: br));
  }
}
