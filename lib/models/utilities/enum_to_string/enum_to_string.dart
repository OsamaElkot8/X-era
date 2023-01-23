import 'package:flutter/foundation.dart';
import 'package:xera_task/models/utilities/enum_to_string/enum_to_string_manager.dart';

class EnumToString extends EnumToStringManager {
  static final EnumToString instance = EnumToString._internal();

  factory EnumToString() {
    return instance;
  }

  EnumToString._internal();

  @override
  String convertToString(value) {
    return describeEnum(value);
  }

  @override
  T fromString<T>(List<T> enumValues, String value) {
    return enumValues.firstWhere((e) => convertToString(e) == value);
  }
}
