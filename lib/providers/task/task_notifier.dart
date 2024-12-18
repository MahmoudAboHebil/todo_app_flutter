import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/data/data.dart';

import 'task_state.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskRepositoryImpl _taskRepositoryImpl;
  TaskNotifier(this._taskRepositoryImpl) : super(const TaskState.init());

  Future<void> addTask(Task task) async {
    try {
      await _taskRepositoryImpl.addTask(task);
      await getAllTasks();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _taskRepositoryImpl.deleteTask(task);
      await getAllTasks();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    try {
      await _taskRepositoryImpl.updateTask(updatedTask);
      await getAllTasks();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getAllTasks() async {
    try {
      final newTasks = await _taskRepositoryImpl.getAllTasks();
      state = state.copyWith(newTasks);
    } catch (e) {
      print(e.toString());
    }
  }
}
