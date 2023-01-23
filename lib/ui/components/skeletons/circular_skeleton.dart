import 'package:flutter/material.dart';
import 'package:xera_task/ui/components/skeletons/rectangular_skeleton.dart';

class CircularSkeleton extends StatelessWidget {
  final double? size;
  const CircularSkeleton({Key? key, this.size}) : super(key: key);

  final double _defaultImageSize = 60.0;

  double get _skeletonSize => size ?? _defaultImageSize;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: RectangularSkeleton(
        height: _skeletonSize,
        width: _skeletonSize,
      ),
    );
  }
}
