import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/settings/settings_service.dart';
import 'package:xera_task/ui/constants/style/constants_manager.dart';

class RectangularSkeleton extends StatelessWidget {
  final double? height, width;
  const RectangularSkeleton({Key? key, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalSettingsBloc, LocalSettingsBlocState>(
        builder: (context, state) {
      final LocalSettings settings = state.settings;
      final UiConstantsManager currentThemeModeConstants = SettingsService
          .instance
          .currentThemeModeConstants(localSettings: settings);

      return Shimmer.fromColors(
        baseColor: currentThemeModeConstants.colorDefaultSkeletonBaseColor,
        highlightColor:
            currentThemeModeConstants.colorDefaultSkeletonHighlightColor,
        child: Container(
          height: height,
          width: width,
          color: currentThemeModeConstants.colorDefaultSkeletonBaseColor,
        ),
      );
    });
  }
}
