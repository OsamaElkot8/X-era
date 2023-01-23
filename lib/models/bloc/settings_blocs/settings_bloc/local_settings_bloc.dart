import 'package:xera_task/models/bloc/closable_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_event.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/settings/settings_service.dart';

class LocalSettingsBloc
    extends ClosableBloc<LocalSettingsBlocEvent, LocalSettingsBlocState> {
  LocalSettingsBloc({LocalSettingsBlocState? initialState})
      : super(initialState ?? SettingsIdle()) {
    on<SettingsFetch>((event, emit) async {
      try {
        emit(SettingsLoading());

        final SettingsService settingsService = SettingsService.instance;
        final LocalSettings settings = await settingsService.fetchSettings();
        final LocalSettings defaultSettings = settingsService.defaultSettings();

        settings.locale ??= defaultSettings.locale;
        settings.theme ??= defaultSettings.theme;

        emit(SettingsLoaded(settings));
      } catch (e) {
        emit(SettingsLoadingError(reason: e.toString()));
      }
    });
  }
}
