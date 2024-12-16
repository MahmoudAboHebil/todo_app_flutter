import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helper {
  const Helper._();

  static String timeToString(TimeOfDay time) {
    try {
      DateTime now = DateTime.now();
      final date =
          DateTime(now.year, now.month, now.day, time.hour, time.minute);
      return DateFormat.jm().format(date);
    } catch (e) {
      return '12:00 pm';
    }
  }
}
