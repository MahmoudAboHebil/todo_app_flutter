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

    return await openDatabase(myPath,
        onCreate: _onCreate, version: 3, onUpgrade: _upGrade);
  }

  void _upGrade(db, oldVersion, newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute('''
    CREATE TABLE IF NOT EXISTS ${AppKeys.dbTaskTable} (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      note TEXT,
      date TEXT,
      time TEXT,
      category TEXT,
      isCompleted INTEGER
    )
    ''');
    }
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${AppKeys.dbTaskTable} (
     ${TaskKeys.id}  INTEGER PRIMARY KEY  AUTOINCREMENT ,
     ${TaskKeys.title} TEXT,
     ${TaskKeys.note} TEXT,
     ${TaskKeys.date} TEXT,
     ${TaskKeys.time} TEXT,
     ${TaskKeys.category} TEXT,
     ${TaskKeys.isCompleted} INTEGER
    )
    ''');
  }

  Future<int> addTask(Task task) async {
    try {
      final db = await database;
      final response = await db.insert(
        AppKeys.dbTaskTable,
        task.toJson(task),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> deleteTask(Task task) async {
    try {
      final db = await database;
      final response = await db.delete(
        AppKeys.dbTaskTable,
        where: 'id = ?',
        whereArgs: [task.id],
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> updateTask(Task task) async {
    try {
      final db = await database;
      final response = db.update(
        AppKeys.dbTaskTable,
        task.toJson(task),
        where: 'id = ?',
        whereArgs: [task.id],
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Task>> getAllTasks() async {
    try {
      final db = await database;
      List<Map<String, dynamic>> response =
          await db.query(AppKeys.dbTaskTable, orderBy: "id DESC");

      final tasks = response.map((item) => Task.fromJson(item)).toList();

      return tasks;
    } catch (e) {
      rethrow;
    }
  }
}
