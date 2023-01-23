import 'package:flutter/material.dart';
import 'package:xera_task/ui/components/progress_indicators/default_progress_view.dart';
import 'package:xera_task/ui/constants/constants.dart';

class UIHelper {
  static final UIHelper instance = UIHelper._internal();

  factory UIHelper() {
    return instance;
  }

  UIHelper._internal();

  final int _temporaryScreenDurationInSeconds = 3;

  void showSnackBarMessage(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  showProgressIndicator(BuildContext context) => showDialog(
        context: context,
        barrierDismissible:
            UiConstants.booleanDefaultProgressIndicatorDismissible,
        builder: (context) => const DefaultProgressIndicatorView(),
      );

  void hideProgressIndicator(BuildContext context) => _navigationPop(context);

  void showTemporaryScreen(BuildContext context,
      {required Widget screen}) async {
    final Duration duration =
        Duration(seconds: _temporaryScreenDurationInSeconds);

    showDialog(
      useRootNavigator: UiConstants.booleanTemporaryScreenUseRootNavigator,
      barrierDismissible: UiConstants.booleanTemporaryScreenDismissible,
      context: context,
      builder: (context) => screen,
    );
    await Future.delayed(
      duration,
      () => _navigationPop(context),
    );
  }

  void _navigationPop(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pop();
}
