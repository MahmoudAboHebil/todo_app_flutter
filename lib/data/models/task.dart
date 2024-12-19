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

  Task copyWith({
    int? id,
    String? title,
    String? note,
    TaskCategory? category,
    String? time,
    String? date,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      category: category ?? this.category,
      title: title ?? this.title,
      time: time ?? this.time,
      date: date ?? this.date,
      note: note ?? this.note,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toJson(Task task) {
    return {
      TaskKeys.id: task.id,
      TaskKeys.title: task.title,
      TaskKeys.note: task.note,
      TaskKeys.date: task.date,
      TaskKeys.time: task.time,
      TaskKeys.category: task.category.name,
      TaskKeys.isCompleted: task.isCompleted ? 1 : 0,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json[TaskKeys.id] is int ? json[TaskKeys.id] : -1,
      category: TaskCategory.categoryFromString(json[TaskKeys.category]),
      title: json[TaskKeys.title],
      time: json[TaskKeys.time],
      date: json[TaskKeys.date],
      note: json[TaskKeys.note],
      isCompleted: json[TaskKeys.isCompleted] == 1 ? true : false,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      title,
      note,
      time,
      date,
      isCompleted,
    ];
  }
}
