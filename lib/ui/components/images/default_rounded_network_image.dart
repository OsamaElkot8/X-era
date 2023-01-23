import 'package:flutter/material.dart';
import 'package:xera_task/models/utilities/paints/circle_paint.dart';
import 'package:xera_task/ui/components/images/default_network_image/default_network_image.dart';

class DefaultRoundCornerNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? height, width;
  final Color? borderColor;
  final bool? borderShadowEnabled;
  final Widget? placeholder, errorView;
  const DefaultRoundCornerNetworkImage(
      {Key? key,
      this.imageUrl,
      this.height,
      this.width,
      this.borderColor,
      this.borderShadowEnabled = false,
      this.placeholder,
      this.errorView})
      : super(key: key);

  final double _borderPercentage = 1.0,
      _borderThickness = 4.0,
      _imagePaddingSpace = 2.0;

  EdgeInsetsGeometry get _imagePadding => EdgeInsets.all(_imagePaddingSpace);

  @override
  Widget build(BuildContext context) {
    return _borderedRoundedImage();
  }

  Widget _borderedRoundedImage() {
    if (borderColor != null) {
      return Padding(
        padding: _imagePadding, // padding added to avoid paint cut
        child: CustomPaint(
          painter: CircularPaint(
              color: borderColor!,
              progressValue: _borderPercentage,
              borderThickness: _borderThickness,
              withShadow: borderShadowEnabled),
          child: _imageView(),
        ),
      );
    }

    return _imageView();
  }

  Widget _imageView() => ClipOval(
        child: DefaultNetworkImage(
            imageUrl: imageUrl,
            height: height,
            width: width,
            placeholder: placeholder,
            errorView: errorView),
      );
}
