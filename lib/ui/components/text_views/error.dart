import 'package:flutter/material.dart';
import 'package:xera_task/ui/ui_helper.dart';

class ErrorText extends StatelessWidget {
  final String? error;
  const ErrorText({Key? key, this.error}) : super(key: key);

  TextStyle? _textTheme(BuildContext context) =>
      UIHelper.instance.textTheme(context).caption;

  @override
  Widget build(BuildContext context) {
    return error != null
        ? Text(error!, style: _textTheme(context), textAlign: TextAlign.center)
        : const SizedBox();
  }
}
