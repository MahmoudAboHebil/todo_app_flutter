import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/data/data.dart';

final taskRepositoryProvider = Provider((ref) {
  final taskDataSource = ref.watch(taskDataSourceProvider);
  return TaskRepositoryImpl(taskDataSource);
});
