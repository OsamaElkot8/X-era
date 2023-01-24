import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:xera_task/ui/ui_helper.dart';

class DiscoverMovieEmptyList extends StatelessWidget {
  const DiscoverMovieEmptyList({Key? key}) : super(key: key);

  TextStyle? _textTheme(BuildContext context) =>
      UIHelper.instance.textTheme(context).headline1;

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.noMoviesYet,
      style: _textTheme(context),
    );
  }
}
