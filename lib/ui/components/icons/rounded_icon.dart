import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  final Widget icon;
  final Color? background;
  const RoundedIcon({Key? key, required this.icon, this.background})
      : super(key: key);

  final double _iconPaddingSpace = 5.0;

  EdgeInsetsGeometry get _iconPadding => EdgeInsets.all(_iconPaddingSpace);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: background,
        padding: _iconPadding,
        child: icon,
      ),
    );
  }
}
