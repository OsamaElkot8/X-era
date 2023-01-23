import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/settings/settings_service.dart';
import 'package:xera_task/ui/constants/constants.dart';
import 'package:xera_task/ui/constants/style/constants_manager.dart';

class DefaultRoundButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  const DefaultRoundButton(
      {Key? key,
      required this.child,
      this.onPressed,
      this.padding,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalSettingsBloc, LocalSettingsBlocState>(
        builder: (context, state) {
      final LocalSettings settings = state.settings;
      final UiConstantsManager currentThemeModeConstants = SettingsService
          .instance
          .currentThemeModeConstants(localSettings: settings);

      return InkWell(
        onTap: onPressed,
        child: ClipOval(
          child: Container(
            color: (backgroundColor ?? currentThemeModeConstants.colorPrimary),
            padding:
                (padding ?? UiConstants.edgeInsetsDefaultPaddingRoundButton),
            child: child,
          ),
        ),
      );
    });
  }
}
