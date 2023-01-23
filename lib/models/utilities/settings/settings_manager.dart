import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/ui/constants/style/constants_manager.dart';

abstract class SettingsManager {
  LocalSettings defaultSettings();
  Future<LocalSettings> fetchSettings();
  UiConstantsManager currentThemeModeConstants(
      {required LocalSettings localSettings});
}
