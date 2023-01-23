import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/settings/settings_service.dart';
import 'package:xera_task/ui/constants/constants.dart';
import 'package:xera_task/ui/constants/style/constants_manager.dart';

class DefaultProgressIndicatorView extends StatelessWidget {
  const DefaultProgressIndicatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalSettingsBloc, LocalSettingsBlocState>(
        builder: (context, state) {
      final LocalSettings settings = state.settings;
      final UiConstantsManager currentThemeModeConstants = SettingsService
          .instance
          .currentThemeModeConstants(localSettings: settings);

      return Center(
        child: Container(
          width: UiConstants.doubleDefaultProgressIndicatorSize,
          height: UiConstants.doubleDefaultProgressIndicatorSize,
          decoration: BoxDecoration(
            color: currentThemeModeConstants
                .colorDefaultProgressIndicatorBackground,
            borderRadius: UiConstants.borderRadiusDefaultProgressIndicator,
          ),
          child: const Padding(
            padding: UiConstants.edgeInsetsDefaultProgressIndicator,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    });
  }
}
