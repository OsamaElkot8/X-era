import 'package:flutter/material.dart';
import 'package:xera_task/ui/ui_helper.dart';

class DiscoverMovieOverview extends StatelessWidget {
  final String? overview;
  const DiscoverMovieOverview({Key? key, this.overview}) : super(key: key);

  TextStyle? _textTheme(BuildContext context) =>
      UIHelper.instance.textTheme(context).bodyText1;

  @override
  Widget build(BuildContext context) {
    return overview != null
        ? Text(
            overview!,
            style: _textTheme(context),
          )
        : const SizedBox();
  }
}
