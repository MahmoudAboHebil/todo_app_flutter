import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/data/data.dart';
import 'package:todo_app_flutter/providers/providers.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final taskRepositoryImpl = ref.watch(taskRepositoryProvider);
  return TaskNotifier(taskRepositoryImpl);
});
