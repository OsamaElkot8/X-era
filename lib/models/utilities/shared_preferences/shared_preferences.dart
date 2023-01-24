import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'
    as external_shared_preferences;
import 'package:xera_task/models/utilities/enum_to_string/enum_to_string.dart';
import 'package:xera_task/models/utilities/shared_preferences/shared_preferences_constants.dart';

class SharedPreferences {
  static final SharedPreferences instance = SharedPreferences._internal();
  external_shared_preferences.SharedPreferences? _prefs;

  factory SharedPreferences() {
    return instance;
  }

  SharedPreferences._internal() {
    _initializeSharedPreferences();
  }

  Future<void> _initializeSharedPreferences() async {
    _prefs = await external_shared_preferences.SharedPreferences.getInstance();
  }

  Future<external_shared_preferences.SharedPreferences?> _getPrefs() async {
    if (_prefs == null) await _initializeSharedPreferences();
    return _prefs;
  }

  Future<List<String>> getMoviesSearchHistory() async =>
      (await _getPrefs())!
          .getStringList(SharedPreferencesConstants.keyMoviesSearchHistory) ??
      [];

  Future<bool> saveToMoviesSearchHistory({required String query}) async {
    List<String> searchHistory = await getMoviesSearchHistory();

    //Place it at first in the set
    searchHistory.insert(0, query);
    return await (await _getPrefs())!.setStringList(
        SharedPreferencesConstants.keyMoviesSearchHistory,
        searchHistory.toSet().toList());
  }

  Future<bool> removeMoviesSearchHistory() async {
    return await (await _getPrefs())!
        .remove(SharedPreferencesConstants.keyMoviesSearchHistory);
  }

  Future<bool> setBaseUrl(String url) async {
    return await (await _getPrefs())!
        .setString(SharedPreferencesConstants.keyBaseUrl, url);
  }

  Future<String?> getBaseUrl() async {
    String? userToken =
        (await _getPrefs())!.getString(SharedPreferencesConstants.keyBaseUrl);

    return userToken;
  }

  Future<bool> checkBaseUrl() async {
    String? url = await getBaseUrl();
    bool urlExist = url != null;
    return urlExist;
  }

  Future<bool> setUniversityLogoUrl(String? url) async {
    if (url == null) {
      return await _removeUniversityLogoUrl();
    }

    return await (await _getPrefs())!
        .setString(SharedPreferencesConstants.keyUniversityLogoUrl, url);
  }

  Future<String?> getUniversityLogoUrl() async {
    String? userToken = (await _getPrefs())!
        .getString(SharedPreferencesConstants.keyUniversityLogoUrl);

    return userToken;
  }

  Future<bool> _removeUniversityLogoUrl() async {
    return await (await _getPrefs())!
        .remove(SharedPreferencesConstants.keyUniversityLogoUrl);
  }

  Future<bool> setUserToken(String token) async {
    return await (await _getPrefs())!
        .setString(SharedPreferencesConstants.keyUserToken, token);
  }

  Future<bool> removeUserToken() async {
    return await (await _getPrefs())!
        .remove(SharedPreferencesConstants.keyUserToken);
  }

  Future<String?> getUserToken() async {
    String? userToken =
        (await _getPrefs())!.getString(SharedPreferencesConstants.keyUserToken);

    return userToken;
  }

  Future<bool> checkUserAuthentication() async {
    String? userToken = await getUserToken();
    bool userAuthenticated = userToken != null;
    return userAuthenticated;
  }

  Future<bool> onBoardingMakeSeen() async {
    const bool seen = true;
    return await (await _getPrefs())!
        .setBool(SharedPreferencesConstants.keyOnBoardingSeen, seen);
  }

  Future<bool> checkOnBoardingSeen() async {
    bool? seen = (await _getPrefs())!
        .getBool(SharedPreferencesConstants.keyOnBoardingSeen);
    seen ??= false;

    return seen;
  }

  Future<bool> setLocale(Locale locale) async {
    return await (await _getPrefs())!
        .setString(SharedPreferencesConstants.keyLocale, locale.languageCode);
  }

  Future<Locale?> getLocale() async {
    String? localeLanguageCode =
        (await _getPrefs())!.getString(SharedPreferencesConstants.keyLocale);

    if (localeLanguageCode == null) {
      return null;
    }

    return Locale(localeLanguageCode);
  }

  Future<bool> setTheme(ThemeMode themeMode) async {
    return await (await _getPrefs())!.setString(
        SharedPreferencesConstants.keyTheme,
        EnumToString.instance.convertToString(themeMode));
  }

  Future<ThemeMode?> getTheme() async {
    String? themeInString =
        (await _getPrefs())!.getString(SharedPreferencesConstants.keyTheme);

    if (themeInString == null) {
      return null;
    }

    return EnumToString.instance
        .fromString<ThemeMode>(ThemeMode.values, themeInString);
  }
}
