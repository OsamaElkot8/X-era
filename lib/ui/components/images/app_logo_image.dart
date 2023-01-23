import 'package:flutter/material.dart';
import 'package:xera_task/ui/constants/constants.dart';

class AppLogoImage extends StatelessWidget {
  final double? height, width;
  const AppLogoImage({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(UiConstants.stringAppLogoPath,
        fit: BoxFit.fill, height: height, width: width);
  }
}
