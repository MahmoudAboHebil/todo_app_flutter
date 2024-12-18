import '../datasource/datasource.dart';
import '../models/models.dart';
import 'task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TaskDataSource taskDataSource;
  TaskRepositoryImpl(this.taskDataSource);

  @override
  Future<int> addTask(Task task) async {
    try {
      return await taskDataSource.addTask(task);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> deleteTask(Task task) async {
    try {
      return await taskDataSource.deleteTask(task);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Task>> getAllTasks() async {
    try {
      return await taskDataSource.getAllTasks();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> updateTask(Task task) async {
    try {
      return await taskDataSource.updateTask(task);
    } catch (e) {
      rethrow;
    }
  }
}
