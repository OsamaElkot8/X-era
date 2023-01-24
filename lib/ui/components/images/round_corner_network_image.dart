import 'package:flutter/material.dart';
import 'package:xera_task/ui/components/images/default_network_image/default_network_image.dart';

class RoundCornerNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? height, width;
  final BorderRadiusGeometry? borderRadius;
  const RoundCornerNetworkImage(
      {Key? key, this.imageUrl, this.height, this.width, this.borderRadius})
      : super(key: key);

  final double _cornerBorderRadiusCircular = 6.0;

  BorderRadius get _cornerBorderRadius =>
      BorderRadius.all(Radius.circular(_cornerBorderRadiusCircular));

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? _cornerBorderRadius,
      child: DefaultNetworkImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
      ),
    );
  }
}
