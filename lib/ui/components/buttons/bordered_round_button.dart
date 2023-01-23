import 'package:flutter/material.dart';
import 'package:xera_task/models/utilities/paints/circle_paint.dart';
import 'package:xera_task/ui/components/buttons/default_round_button.dart';

class BorderedRoundButton extends StatelessWidget {
  final Color borderColor;
  final Color? buttonColor;
  final double circleBorderPercentage;
  final EdgeInsetsGeometry? borderPadding, buttonPadding;
  final Widget child;
  final void Function() onPressed;
  const BorderedRoundButton(
      {Key? key,
      required this.borderColor,
      required this.circleBorderPercentage,
      this.borderPadding,
      this.buttonColor,
      this.buttonPadding,
      required this.child,
      required this.onPressed})
      : super(key: key);

  final double _borderThickness = 2.0;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircularPaint(
          color: borderColor,
          progressValue: circleBorderPercentage,
          borderThickness: _borderThickness),
      child: Padding(
        padding: borderPadding ?? EdgeInsets.zero,
        child: DefaultRoundButton(
          onPressed: onPressed,
          padding: buttonPadding ?? EdgeInsets.zero,
          backgroundColor: buttonColor,
          child: child,
        ),
      ),
    );
  }
}
