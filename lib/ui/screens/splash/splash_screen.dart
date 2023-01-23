import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xera_task/models/utilities/system_overlay/system_overlay_service.dart';
import 'package:xera_task/ui/screens/home/home_screen.dart';
import 'package:xera_task/ui/screens/splash/logo.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'splashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  final double _screenHorizontalPaddingSpace = 8.0,
      _screenVerticalPaddingSpace = 12.0;
  EdgeInsetsGeometry get _screenPadding => EdgeInsets.symmetric(
      horizontal: _screenHorizontalPaddingSpace,
      vertical: _screenVerticalPaddingSpace);

  Future<void> _navigateToNextScreen(BuildContext context) =>
      Navigator.pushReplacementNamed(context, HomeScreen.id);

  Future<void> _hideStatusBar() async =>
      await SystemOverlayService.instance.hideStatusBar();

  void _postFrameCallback(BuildContext context) async {
    // this function is used AfterBuild , so context != null
    await _hideStatusBar();
    // ignore: use_build_context_synchronously
    _navigateToNextScreen(context);
  }

  void _setUpAfterBuild(BuildContext context) => WidgetsBinding.instance
      .addPostFrameCallback((_) => _postFrameCallback(context));

  @override
  Widget build(BuildContext context) {
    _setUpAfterBuild(context);

    return Scaffold(
      body: Padding(
        padding: _screenPadding,
        child: const Center(
          child: SplashLogo(),
        ),
      ),
    );
  }
}
