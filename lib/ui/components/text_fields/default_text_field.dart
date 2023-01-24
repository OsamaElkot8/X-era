import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc.dart';
import 'package:xera_task/models/bloc/settings_blocs/settings_bloc/local_settings_bloc_state.dart';
import 'package:xera_task/models/entities/settings/local_settings/local_settings.dart';
import 'package:xera_task/models/utilities/settings/settings_service.dart';
import 'package:xera_task/ui/constants/style/constants_manager.dart';

class DefaultTextField extends StatefulWidget {
  final String? initialValue, hint;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool clearIcon;
  final bool? enabled, readOnly;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final Widget? suffix;
  final double elevation;
  const DefaultTextField(
      {Key? key,
      this.hint,
      this.controller,
      this.focusNode,
      this.onChanged,
      this.onFieldSubmitted,
      this.enabled = true,
      this.readOnly = false,
      this.initialValue,
      this.textInputType,
      this.prefixIcon,
      this.suffix,
      this.clearIcon = false,
      this.elevation = 8.0})
      : super(key: key);

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  late FocusNode _focus;
  final double _fontSize = 14.0,
      _containerDXOffset = 0.0,
      _containerDYOffset = 1.0,
      _cornerBorderRadiusCircular = 20.0,
      _cardPaddingSpace = 6.0;

  EdgeInsetsGeometry get _cardPadding => EdgeInsets.all(_cardPaddingSpace);
  late TextEditingController _controller;

  Offset get _containerOffset => Offset(_containerDXOffset, _containerDYOffset);

  BorderRadius get _cornerBorderRadius =>
      BorderRadius.all(Radius.circular(_cornerBorderRadiusCircular));

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _focus = widget.focusNode ?? FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalSettingsBloc, LocalSettingsBlocState>(
        builder: (context, state) {
      final LocalSettings settings = state.settings;
      final UiConstantsManager currentThemeModeConstants = SettingsService
          .instance
          .currentThemeModeConstants(localSettings: settings);

      return Container(
        padding: _cardPadding,
        decoration: BoxDecoration(
          color: currentThemeModeConstants.colorTextFieldBackground,
          border: Border.all(
            color: currentThemeModeConstants.colorPrimary,
          ),
          borderRadius: _cornerBorderRadius,
          boxShadow: [
            BoxShadow(
              color: currentThemeModeConstants.colorTextFieldShadow,
              offset: _containerOffset,
              blurRadius: widget.elevation,
            ),
          ],
        ),
        child: TextFormField(
          controller: _controller,
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
            errorBorder: InputBorder.none,
            suffixIcon: _suffixView(),
            prefixIcon: Icon(
              widget.prefixIcon,
              color: currentThemeModeConstants.colorPrimary,
            ),
          ),
          enabled: widget.enabled,
          initialValue: widget.initialValue,
          readOnly: widget.readOnly!,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
        ),
      );
    });
  }

  Widget? _suffixView() {
    if (widget.suffix != null) {
      return widget.suffix;
    }

    if (widget.clearIcon && _controller.text.isNotEmpty) {
      return InkWell(
        onTap: () => setState(_controller.clear),
        child: const Icon(Icons.clear),
      );
    }

    return null;
  }
}
