import 'package:flutter/material.dart';

class SearchMovieFieldOption extends StatelessWidget {
  final void Function()? onSelected;
  final String option;
  const SearchMovieFieldOption(
      {Key? key, this.onSelected, required this.option})
      : super(key: key);

  final double _cardPaddingSpace = 10.0;

  EdgeInsetsGeometry get _cardPadding => EdgeInsets.all(_cardPaddingSpace);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onSelected,
        child: Card(
            child: Container(
          width: double.infinity,
          padding: _cardPadding,
          child: Text(option),
        )));
  }
}
