import 'package:flutter/material.dart';

import 'package:diplom_work/views/colors_view.dart';

class AppColors {
  const AppColors._init();

  factory AppColors.getInstance() {
    _instance ??= const AppColors._init();
    return _instance!;
  }

  static AppColors? _instance;

  List<ColorItem> pr(ColorScheme s) {
    return [
      ColorItem('primary', s.primary, s.onPrimary),
      ColorItem('onPrimary', s.onPrimary, s.primary),
      ColorItem('primaryContainer', s.primaryContainer, s.onPrimaryContainer),
      ColorItem('onPrimaryContainer', s.onPrimaryContainer, s.primaryContainer)
    ];
  }

  List<ColorItem> sc(ColorScheme s) {
    return [
      ColorItem('secondary', s.secondary, s.onSecondary),
      ColorItem('onSecondary', s.onSecondary, s.secondary),
      ColorItem('secondaryContainer', s.secondaryContainer, s.onSecondaryContainer),
      ColorItem('onSecondaryContainer', s.onSecondaryContainer, s.secondaryContainer)
    ];
  }

  List<ColorItem> tr(ColorScheme s) {
    return [
      ColorItem('tertiary', s.tertiary, s.onTertiary),
      ColorItem('onTertiary', s.onTertiary, s.tertiary),
      ColorItem('tertiaryContainer', s.tertiaryContainer, s.onTertiaryContainer),
      ColorItem('onTertiaryContainer', s.onTertiaryContainer, s.tertiaryContainer)
    ];
  }

  List<ColorItem> er(ColorScheme s) {
    return [
      ColorItem('error', s.error, s.onError),
      ColorItem('onError', s.onError, s.error),
      ColorItem('errorContainer', s.errorContainer, s.onErrorContainer),
      ColorItem('onErrorContainer', s.onErrorContainer, s.errorContainer)
    ];
  }

  List<ColorItem> bg(ColorScheme s) {
    return [
      ColorItem('background', s.background, s.onBackground),
      ColorItem('onBackground', s.onBackground, s.background),
    ];
  }

  List<ColorItem> sr(ColorScheme s) {
    return [
      ColorItem('surface', s.surface, s.onSurface),
      ColorItem('onSurface', s.onSurface, s.surface),
      ColorItem('surfaceVariant', s.surfaceVariant, s.onSurfaceVariant),
      ColorItem('onSurfaceVariant', s.onSurfaceVariant, s.surfaceVariant)
    ];
  }

  List<ColorItem> other(ColorScheme s) {
    return [
      ColorItem('outline', s.outline, s.surface),
      ColorItem('shadow', s.shadow, s.surface),
      ColorItem('inverseSurface', s.inverseSurface, s.onInverseSurface),
      ColorItem('onInverseSurface', s.onInverseSurface, s.inverseSurface),
      ColorItem('inversePrimary', s.inversePrimary, s.primary)
    ];
  }
}
