import 'package:flutter/material.dart';
import 'package:xera_task/ui/ui_helper.dart';

class DiscoverMovieReleaseDate extends StatelessWidget {
  final String? releaseDate;
  const DiscoverMovieReleaseDate({Key? key, this.releaseDate})
      : super(key: key);

  TextStyle? _textTheme(BuildContext context) =>
      UIHelper.instance.textTheme(context).caption;

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
