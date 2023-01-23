import 'package:flutter/material.dart';
import 'package:xera_task/ui/components/images/app_logo_image.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({Key? key}) : super(key: key);

  final double _logoSize = 32.0;

  @override
  Widget build(BuildContext context) {
    return AppLogoImage(height: _logoSize, width: _logoSize);
  }
}
