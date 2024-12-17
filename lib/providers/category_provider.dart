import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app_flutter/utils/utils.dart';

final categoryProvider = StateProvider.autoDispose<TaskCategory>((ref) {
  return TaskCategory.values[0];
});
