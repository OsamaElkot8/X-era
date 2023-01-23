import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/paints/night_stars_paint.dart';
import 'package:xera_task/models/utilities/settings/settings_service.dart';
import 'package:xera_task/ui/constants/style/constants_manager.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  final double _screenHorizontalPaddingSpace = 18.0,
      _screenVerticalPaddingSpace = 12.0;
  EdgeInsetsGeometry get _screenPadding => EdgeInsets.symmetric(
      horizontal: _screenHorizontalPaddingSpace,
      vertical: _screenVerticalPaddingSpace);

  void _fetchDashboard(BuildContext context) {
    // final dashboardBloc = context.read<DashboardBloc>();
    // dashboardBloc.add(DashboardFetch());
  }

  void _postFrameCallback(BuildContext context) {
    _fetchDashboard(context);
  }

  void _setUpAfterBuild(BuildContext context) => WidgetsBinding.instance
      .addPostFrameCallback((_) => _postFrameCallback(context));

  @override
  Widget build(BuildContext context) {
    _setUpAfterBuild(context);

    return Scaffold(
      body: BlocBuilder<LocalSettingsBloc, LocalSettingsBlocState>(
          builder: (context, state) {
        final LocalSettings settings = state.settings;
        final UiConstantsManager currentThemeModeConstants = SettingsService
            .instance
            .currentThemeModeConstants(localSettings: settings);

        return CustomPaint(
          painter: NightStarsPaint(
              upperColor: currentThemeModeConstants.colorPrimary,
              lowerColor: currentThemeModeConstants.colorScaffoldBackground),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            padding: _screenPadding,
            child: Column(
              children: const [],
            ),
          ),
        );
      }),
    );
  }
}
