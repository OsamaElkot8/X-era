import 'package:flutter/material.dart';
import 'package:xera_task/ui/components/images/default_network_image/default_network_image.dart';

class DiscoverMovieThumbnail extends StatelessWidget {
  final String? thumbnail;
  const DiscoverMovieThumbnail({Key? key, this.thumbnail}) : super(key: key);

  final double _imageHeight = 200.0, _imageWidth = double.infinity;

  @override
  Widget build(BuildContext context) {
    return DefaultNetworkImage(
        imageUrl: thumbnail, width: _imageWidth, height: _imageHeight);
  }
}
