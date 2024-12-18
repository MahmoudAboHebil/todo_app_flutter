import 'package:equatable/equatable.dart';
import 'package:todo_app_flutter/data/data.dart';

class TaskState extends Equatable {
  const TaskState({required this.tasks});
  const TaskState.init({this.tasks = const <Task>[]});
  final List<Task> tasks;

  TaskState copyWith(List<Task>? tasks) {
    tasks ?? this.tasks;
    return TaskState(tasks: tasks!);
  }

  @override
  List<Object> get props => [tasks];
}
