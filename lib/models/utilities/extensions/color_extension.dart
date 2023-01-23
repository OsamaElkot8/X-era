import 'package:flutter/material.dart';
import 'package:xera_task/ui/constants/constants.dart';

extension ColorExtension on Color {
  String toHexString() =>
      UiConstants.stringHashSymbol + value.toRadixString(16).toString();

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst(
        UiConstants.stringHashSymbol, UiConstants.stringEmpty));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color? colorFromJson(String? color) {
    if (color == null) {
      return null;
    }

    return fromHex(color);
  }

  static String? colorToJson(Color? color) {
    if (color == null) return null;

    return color.toHexString();
  }
}
