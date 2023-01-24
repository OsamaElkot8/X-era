import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/settings/settings_service.dart';
import 'package:xera_task/ui/components/text_fields/default_text_field/default_text_field.dart';
import 'package:xera_task/ui/constants/style/constants_manager.dart';

class SearchMovieField extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchMovieField({Key? key, this.onChanged}) : super(key: key);

  final bool _clearIconEnabled = true;

  final double _fieldHorizontalPaddingSpace = 18.0,
      _fieldVerticalPaddingSpace = 12.0,
      _containerDXOffset = 0.0,
      _containerDYOffset = 1.0,
      _containerBlurRadius = 6.0;

  EdgeInsetsGeometry get _fieldPadding => EdgeInsets.symmetric(
      horizontal: _fieldHorizontalPaddingSpace,
      vertical: _fieldVerticalPaddingSpace);

  Offset get _containerOffset => Offset(_containerDXOffset, _containerDYOffset);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalSettingsBloc, LocalSettingsBlocState>(
        builder: (context, state) {
      final LocalSettings settings = state.settings;
      final UiConstantsManager currentThemeModeConstants = SettingsService
          .instance
          .currentThemeModeConstants(localSettings: settings);

      return Container(
        padding: _fieldPadding,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: currentThemeModeConstants.colorMovieSearchFieldShadow,
              offset: _containerOffset,
              blurRadius: _containerBlurRadius,
            ),
          ],
        ),
        child: DefaultTextField(
          prefixIcon: Icons.search,
          onChanged: onChanged,
          clearIcon: _clearIconEnabled,
        ),
      );
    });
  }
}
