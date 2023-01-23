import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LocalesConstants {
  static const Locale defaultLocale = Locale('en');

  static const Iterable<Locale> supportedLocales = [
    Locale('en'),
    Locale('fr'),
  ];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
  ];

  static Locale localeResolutionCallback(locale, supportedLocales) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale!.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}
