import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/settings/settings_service.dart';
import 'package:xera_task/ui/constants/constants.dart';
import 'package:xera_task/ui/constants/style/constants_manager.dart';

import 'error_text.dart';
import 'sub_title_text.dart';

class DefaultTextField extends StatefulWidget {
  final String? initialValue, hint, subTitle;
  final TextEditingController? controller;
  final bool obscuringEnabled, clearIcon;
  final bool? enabled, readOnly;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final Widget? suffix;
  const DefaultTextField(
      {Key? key,
      this.hint,
      this.controller,
      this.obscuringEnabled = false,
      this.validator,
      this.onChanged,
      this.enabled = true,
      this.readOnly = false,
      this.initialValue,
      this.textInputType,
      this.prefixIcon,
      this.subTitle,
      this.suffix,
      this.clearIcon = false})
      : super(key: key);

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  bool _obscureText = false;
  final FocusNode _focus = FocusNode();
  final double _fontSize = 14.0, _errorDivider = 5.0;
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    super.initState();
    // in case of obscuring enabled, initialize text obscure to be secured.
    if (widget.obscuringEnabled) _obscureText = true;
  }

  Color _prefixIconColor(UiConstantsManager currentThemeModeConstants) =>
      _focus.hasFocus
          ? currentThemeModeConstants.colorPrimary
          : currentThemeModeConstants.colorInputDecorationHintIconColor;

  Color _borderColor(UiConstantsManager currentThemeModeConstants) =>
      _focus.hasFocus
          ? currentThemeModeConstants.colorPrimary
          : currentThemeModeConstants.colorDefaultTextFieldBorder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalSettingsBloc, LocalSettingsBlocState>(
        builder: (context, state) {
      final LocalSettings settings = state.settings;
      final UiConstantsManager currentThemeModeConstants = SettingsService
          .instance
          .currentThemeModeConstants(localSettings: settings);

      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: _borderColor(currentThemeModeConstants)),
              borderRadius: UiConstants.borderRadiusInputDecoration,
            ),
            leading: Icon(
              widget.prefixIcon,
              color: _prefixIconColor(currentThemeModeConstants),
            ),
            title: TextFormField(
              controller: widget.controller,
              focusNode: _focus,
              style: currentThemeModeConstants.textStyleDefaultTextFieldStyle
                  .copyWith(fontSize: _fontSize),
              keyboardType: widget.textInputType,
              decoration: InputDecoration(
                  hintText: widget.hint,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none),
              obscureText: _obscureText,
              enabled: widget.enabled,
              initialValue: widget.initialValue,
              readOnly: widget.readOnly!,
              onChanged: widget.onChanged,
            ),
            subtitle: _subtitleView(),
            trailing: _suffixView(),
          ),
          if (_validationError != null)
            SizedBox(
              height: _errorDivider,
            ),
          if (_validationError != null)
            DefaultTextFieldErrorText(text: _validationError!)
        ],
      );
    });
  }

  Widget? _suffixView() {
    if (widget.suffix != null) {
      return widget.suffix;
    }

    if (widget.clearIcon) {
      return IconButton(
          onPressed: _controller.clear, icon: const Icon(Icons.clear));
    }

    if (widget.obscuringEnabled) {
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () => setState(() => _obscureText = !_obscureText),
      );
    }

    return null;
  }

  Widget? _subtitleView() => widget.subTitle != null
      ? DefaultTextFieldSubTitleText(text: widget.subTitle!)
      : null;

  String? get _validationError {
    if (widget.validator == null) {
      return null;
    }

    return widget.validator!.call(_controller.text);
  }
}
