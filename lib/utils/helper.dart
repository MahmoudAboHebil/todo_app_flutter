import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../data/models/models.dart';
import '../providers/providers.dart';

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

  static List<Task> getCompletedTasks(List<Task> tasks) {
    return tasks.where((task) => task.isCompleted).toList();
  }

  static List<Task> getNotCompletedTasks(List<Task> tasks) {
    return tasks.where((task) => !task.isCompleted).toList();
  }

  static Future<void> selectDate(BuildContext context, WidgetRef ref) async {
    final date = ref.read(dateProvider);

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2023),
      lastDate: DateTime(2090),
    );
    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }

  static Future<void> selectTime(BuildContext context, WidgetRef ref) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }

  static bool isTaskInSelectedDate(
    BuildContext context,
    Task task,
    WidgetRef ref,
  ) {
    final selectedDate = ref.watch(dateProvider);
    DateTime taskDate = _stringToDate(task.date);
    if (selectedDate.year == taskDate.year &&
        selectedDate.month == taskDate.month &&
        selectedDate.day == taskDate.day) {
      return true;
    }
    return false;
  }

  static DateTime _stringToDate(String date) {
    DateFormat dateFormat = DateFormat.yMMMd();
    DateTime d = dateFormat.parse(date);
    return d;
  }
}
