import 'package:flutter/material.dart';
import 'package:xera_task/ui/ui_helper.dart';

class SearchMovieTitle extends StatelessWidget {
  final String? title;
  const SearchMovieTitle({Key? key, this.title}) : super(key: key);

  TextStyle? _textTheme(BuildContext context) =>
      UIHelper.instance.textTheme(context).bodyText1;

  @override
  Widget build(BuildContext context) {
    return title != null
        ? Text(
            title!,
            style: _textTheme(context),
          )
        : const SizedBox();
  }
}
