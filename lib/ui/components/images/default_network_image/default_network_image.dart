import 'package:flutter/material.dart';
import 'package:xera_task/ui/components/icons/image_error_view.dart';
import 'package:xera_task/ui/components/skeletons/rectangular_skeleton.dart';
import 'package:xera_task/ui/constants/constants.dart';

class DefaultNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? height, width;
  final BoxFit? boxFit;
  final Widget? placeholder, errorView;
  const DefaultNetworkImage(
      {Key? key,
      this.imageUrl,
      this.width,
      this.height,
      this.boxFit,
      this.placeholder,
      this.errorView})
      : super(key: key);

  // String get _imageUrl =>
  //     '$imageUrl${UiConstants.stringQuestionMark}${DateTime.now().millisecondsSinceEpoch}';

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl ?? UiConstants.stringEmpty,
        // _imageUrl,
        fit: boxFit ?? BoxFit.fill,
        height: height,
        width: width,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return placeholder ??
              RectangularSkeleton(
                height: height,
                width: width,
              );
        },
        errorBuilder: (ctx, exception, stackTrace) =>
            errorView ?? const ImageErrorView());
  }
}
