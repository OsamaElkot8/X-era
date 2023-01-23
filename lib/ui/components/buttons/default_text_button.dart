import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/settings/settings_service.dart';
import 'package:xera_task/ui/constants/constants.dart';
import 'package:xera_task/ui/constants/style/constants_manager.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final TextStyle? textStyle;
  final Color? backGroundColor;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final double? elevation;
  final BoxConstraints? constraints;
  const DefaultTextButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.textStyle,
      this.backGroundColor,
      this.elevation,
      this.padding,
      this.shape,
      this.constraints})
      : super(key: key);

  final double _fontSize = 14.0;

  bool get _enabled => onPressed != null;

  Color _fillColor(UiConstantsManager currentThemeModeConstants) => _enabled
      ? (backGroundColor ??
          currentThemeModeConstants.colorDefaultTextButtonColor)
      : currentThemeModeConstants.colorDefaultTextButtonDisabledColor;

  TextStyle _style(UiConstantsManager currentThemeModeConstants) => _enabled
      ? (textStyle ??
          currentThemeModeConstants.textStyleDefaultTextButton
              .copyWith(fontSize: _fontSize))
      : currentThemeModeConstants.textStyleDefaultTextButtonDisabled
          .copyWith(fontSize: _fontSize);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalSettingsBloc, LocalSettingsBlocState>(
        builder: (context, state) {
      final LocalSettings settings = state.settings;
      final UiConstantsManager currentThemeModeConstants = SettingsService
          .instance
          .currentThemeModeConstants(localSettings: settings);

      return RawMaterialButton(
        onPressed: onPressed,
        fillColor: _fillColor(currentThemeModeConstants),
        shape: shape ?? UiConstants.outlinedBorderTextButtonShape,
        padding: padding ?? UiConstants.edgeInsetsDefaultPaddingTextButton,
        elevation: elevation ?? UiConstants.doubleDefaultTextButtonElevation,
        disabledElevation: UiConstants.doubleDefaultTextButtonElevation,
        constraints: constraints ??
            BoxConstraints(
                minWidth: UiConstants.sizeButtonMinimumSize.width,
                minHeight: UiConstants.sizeButtonMinimumSize.height),
        child: Text(
          text,
          style: _style(currentThemeModeConstants),
        ),
      );
    });
  }
}
