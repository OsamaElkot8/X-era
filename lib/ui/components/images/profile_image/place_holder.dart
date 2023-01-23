import 'package:flutter/material.dart';
import 'package:xera_task/ui/constants/constants.dart';

class ProfileImagePlaceholder extends StatelessWidget {
  final double? height, width;
  const ProfileImagePlaceholder({Key? key, this.height, this.width})
      : super(key: key);

  String get _userPlaceholderPath => UiConstants.stringUserPlaceholderPath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _userPlaceholderPath,
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }
}
