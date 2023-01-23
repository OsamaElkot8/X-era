import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/settings/settings_service.dart';
import 'package:xera_task/repository/networks/constants/shared_keys.dart';

abstract class LocalSettingsBlocState {
  LocalSettings settings = SettingsService.instance.defaultSettings();
}

class SettingsIdle extends LocalSettingsBlocState {}

class SettingsLoading extends LocalSettingsBlocState {}

class SettingsLoaded extends LocalSettingsBlocState {
  SettingsLoaded(settings) {
    this.settings = settings;
  }
}

class SettingsLoadingError extends LocalSettingsBlocState {
  String? reason;
  SettingsLoadingError({this.reason = NetworkSharedKeys.error});
}
