import 'package:flutter/material.dart';

enum MyLocale {
  en(Locale('en'), 'English'),
  ky(Locale('ky'), 'Кыргызча'),
  ru(Locale('ru'), 'Русский'),
  tr(Locale('tr'), 'Türkçe');

  const MyLocale(this.locale, this.name);

  final Locale locale;
  final String name;
}
