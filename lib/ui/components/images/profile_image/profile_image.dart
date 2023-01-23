import 'package:flutter/material.dart';

import '../default_rounded_network_image.dart';
import 'place_holder.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl;
  final double? height, width;
  final Color? borderColor;
  final bool? borderShadowEnabled;
  const ProfileImage(
      {Key? key,
      this.imageUrl,
      this.height,
      this.width,
      this.borderColor,
      this.borderShadowEnabled = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultRoundCornerNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      borderColor: borderColor,
      errorView: _errorView(),
    );
  }

  Widget _errorView() => ProfileImagePlaceholder(height: height, width: width);
}
