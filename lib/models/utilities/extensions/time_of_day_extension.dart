import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExtension on TimeOfDay {
  static TimeOfDay? timeOfDayFromJson(String? formattedTime) {
    if (formattedTime == null || formattedTime.isEmpty) {
      return null;
    }
    DateTime time = DateFormat("HH:mm:ss").parse(formattedTime);

    return TimeOfDay.fromDateTime(time);
  }

  static String? timeOfDayToJson(TimeOfDay? time) {
    if (time == null) {
      return null;
    }

    final DateTime now = DateTime.now();
    final DateTime formattedTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('HH:mm:ss').format(formattedTime);
  }

  String to12HoursFormat() {
    final DateTime now = DateTime.now();
    final DateTime formattedTime =
        DateTime(now.year, now.month, now.day, hour, minute);
    return DateFormat('hh:mm a').format(formattedTime);
  }
}
