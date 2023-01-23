import 'package:flutter/material.dart';
import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/localizations/locales_constants.dart';
import 'package:xera_task/models/utilities/shared_preferences/shared_preferences.dart';
import 'package:xera_task/ui/constants/style/constants_manager.dart';
import 'package:xera_task/ui/constants/style/dark_theme_constants.dart';
import 'package:xera_task/ui/constants/style/light_theme_constants.dart';

import 'settings_manager.dart';

class SettingsService extends SettingsManager {
  static final SettingsService instance = SettingsService._internal();

  factory SettingsService() {
    return instance;
  }

  SettingsService._internal();

  @override
  LocalSettings defaultSettings() {
    Locale locale = LocalesConstants.defaultLocale;
    ThemeMode theme = ThemeMode.light;
    return LocalSettings(locale: locale, theme: theme);
  }

  @override
  Future<LocalSettings> fetchSettings() async {
    Locale? locale = await SharedPreferences.instance.getLocale();
    ThemeMode? theme = await SharedPreferences.instance.getTheme();
    return LocalSettings(locale: locale, theme: theme);
  }

  @override
  UiConstantsManager currentThemeModeConstants(
          {required LocalSettings localSettings}) =>
      localSettings.theme! == ThemeMode.light
          ? LightThemeConstants.instance
          : DarkThemeConstants.instance;
}
