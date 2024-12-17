import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app_flutter/utils/utils.dart';

import '../models/models.dart';

class TaskDataSource {
  static final TaskDataSource _instance = TaskDataSource._();

  TaskDataSource._();
  factory TaskDataSource() {
    return _instance;
  }

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final databasesPath = await getDatabasesPath();
    final myPath = join(databasesPath, AppKeys.dbTask);

    return await openDatabase(myPath, onCreate: _onCreate, version: 1);
  }

  _onCreate(Database db, int version) {
    db.execute('''
    CREATE TABLE ${AppKeys.dbTaskTable} (
     ${TaskKeys.id}  INTEGER PRIMARY KEY NOT NULL AUTOINCREMENT ,
     ${TaskKeys.title} TEXT,
     ${TaskKeys.note} TEXT,
     ${TaskKeys.date} TEXT,
     ${TaskKeys.time} TEXT,
     ${TaskKeys.category} TEXT,
     ${TaskKeys.isCompleted} TEXT,
    )
    ''');
  }

  Future<int> addTask(Task task) async {
    final db = await database;
    final response = db.transaction((tr) async {
      return await db.insert(
        AppKeys.dbTaskTable,
        task.toJson(task),
      );
    });
    return response;
  }

  Future<int> deleteTask(Task task) async {
    final db = await database;
    final response = db.transaction((tr) async {
      return await db.delete(
        AppKeys.dbTaskTable,
        where: 'id : ?',
        whereArgs: [task.id],
      );
    });
    return response;
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    final response = db.transaction((tr) async {
      return await tr.update(
        AppKeys.dbTaskTable,
        task.toJson(task),
        where: 'id : ?',
        whereArgs: [task.id],
      );
    });
    return response;
  }

  Future<List<Task>> getAllTasks() async {
    final db = await database;
    List<Map<String, dynamic>> response = await db.transaction(
      (tr) async {
        return await tr.query(AppKeys.dbTaskTable, orderBy: 'id DESC');
      },
    );

    final tasks = response.map((item) => Task.fromJson(item)).toList();

    return tasks;
  }
}
