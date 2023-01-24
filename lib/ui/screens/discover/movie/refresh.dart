import 'package:flutter/material.dart';
import 'package:xera_task/ui/components/buttons/refresh_button.dart';
import 'package:xera_task/ui/components/text_views/error.dart';

class DiscoverMoviesRefresh extends StatelessWidget {
  final void Function()? onPressed;
  final String? error;
  const DiscoverMoviesRefresh({Key? key, this.onPressed, this.error}) : super(key: key);

  final double _dividerHeight = 15.0;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RefreshButton(onPressed: onPressed,),
         SizedBox(height: _dividerHeight),
        ErrorText(error: error,)
      ],
    );
  }
}
