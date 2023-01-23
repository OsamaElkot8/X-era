import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xera_task/ui/components/icons/image_placeholder_view.dart';
import 'package:xera_task/ui/constants/constants.dart';

class SvgNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? height, width;
  final BoxFit? boxFit;
  final Color? color;
  const SvgNetworkImage(
      {Key? key,
      this.imageUrl,
      this.width,
      this.height,
      this.boxFit,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      imageUrl ?? UiConstants.stringEmpty,
      fit: boxFit ?? BoxFit.fill,
      height: height,
      width: width,
      color: color,
      placeholderBuilder: (ctx) => ImagePlaceholderView(
        iconSize: _placeholderSize,
      ),
    );
  }

  double? get _placeholderSize {
    if (height == null || width == null) {
      return null;
    }
    return (height! + width!) / 2;
  }
}
