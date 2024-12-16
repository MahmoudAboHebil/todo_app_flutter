import 'package:equatable/equatable.dart';
import 'package:todo_app_flutter/utils/utils.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final TaskCategory category;
  final String time;
  final String date;
  final bool isCompleted;
  const Task({
    this.id,
    required this.category,
    required this.title,
    required this.time,
    required this.date,
    required this.note,
    required this.isCompleted,
  });

  @override
  List<Object> get props {
    return [
      title,
      note,
      time,
      date,
      isCompleted,
    ];
  }
}
