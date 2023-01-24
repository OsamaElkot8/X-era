import 'package:flutter/material.dart';
import 'package:xera_task/ui/components/images/round_corner_network_image.dart';

class SearchMovieThumbnail extends StatelessWidget {
  final String? thumbnail;
  const SearchMovieThumbnail({Key? key, this.thumbnail}) : super(key: key);

  final double _imageHeight = 60.0, _imageWidth = 60.0;

  @override
  Widget build(BuildContext context) {
    return RoundCornerNetworkImage(
        imageUrl: thumbnail, width: _imageHeight, height: _imageWidth);
  }
}
