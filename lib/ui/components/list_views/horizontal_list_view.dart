import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final int itemCount;
  const HorizontalListView(
      {Key? key,
      required this.itemCount,
      required this.itemBuilder,
      this.separatorBuilder,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: getChildren(context),
      ),
    );
  }

  List<Widget> getChildren(BuildContext context) {
    final List<Widget> children = [];

    if (itemCount > 0) {
      for (int index = 0; index < itemCount; index++) {
        Widget child = itemBuilder.call(context, index);
        children.add(child);

        final bool isLastIndex = index == (itemCount - 1);

        if (separatorBuilder != null && !isLastIndex) {
          Widget separatorChild = separatorBuilder!.call(context, index);
          children.add(separatorChild);
        }
      }
    }

    return children;
  }
}
