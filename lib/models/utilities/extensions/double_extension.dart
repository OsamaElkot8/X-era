import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String toStringAsTwoDecimals() {
    double value = this;
    return NumberFormat("##.##").format(value);
  }

  String toStringAsOneDecimal() {
    double value = this;
    return NumberFormat("##.#").format(value);
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }
}
