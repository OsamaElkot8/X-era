import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/settings/settings_service.dart';
import 'package:xera_task/ui/constants/style/constants_manager.dart';

class DefaultTabBar extends StatelessWidget {
  final List<String> labels;
  final TabController? controller;
  final bool? isScrollable;
  const DefaultTabBar(
      {Key? key,
      required this.labels,
      this.controller,
      this.isScrollable = false})
      : super(key: key);

  final double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalSettingsBloc, LocalSettingsBlocState>(
        builder: (context, state) {
      final LocalSettings settings = state.settings;
      final UiConstantsManager currentThemeModeConstants = SettingsService
          .instance
          .currentThemeModeConstants(localSettings: settings);

      return TabBar(
        tabs: labels
            .map((String label) => Tab(
                  child: Text(
                    label,
                    style: currentThemeModeConstants.textStyleTabBarLabel
                        .copyWith(fontSize: _fontSize),
                  ),
                ))
            .toList(),
        indicatorColor: currentThemeModeConstants.colorPrimary,
        controller: controller,
        isScrollable: isScrollable!,
      );
    });
  }
}
