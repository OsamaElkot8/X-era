import 'package:flutter/material.dart';
import 'package:xera_task/ui/ui_helper.dart';

class SearchMovieReleaseDate extends StatelessWidget {
  final String? releaseDate;
  const SearchMovieReleaseDate({Key? key, this.releaseDate}) : super(key: key);

  TextStyle? _textTheme(BuildContext context) =>
      UIHelper.instance.textTheme(context).subtitle1;

  @override
  Widget build(BuildContext context) {
    return releaseDate != null
        ? Text(
            releaseDate!,
            style: _textTheme(context),
            textAlign: TextAlign.right,
          )
        : const SizedBox();
  }
}
