import '../models/task.dart';

abstract class TaskRepository {
  Future<int> addTask(Task task);

  Future<int> deleteTask(Task task);

  Future<int> updateTask(Task task);

  Future<List<Task>> getAllTasks();
}
