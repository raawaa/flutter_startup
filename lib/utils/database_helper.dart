import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_startup/models/task.dart';

class DatabaseHelper {
  static Database _db;
  static final _databaseHelper = new DatabaseHelper._internal();
  factory DatabaseHelper() {
    return _databaseHelper;
  }
  DatabaseHelper._internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await _initDB();
      return _db;
    }
  }

  _initDB() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, "database.db");
    print('DATABASE PATH: '+path);
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "create table tasks(id integer primary key, title text,content text)");
    print('database created!');
  }

  Future<List<Task>> getTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> res = await dbClient.query('tasks');
    List<Task> tasks = res.map((r) => Task.fromMap(r)).toList();
    print('getTasks: ');
    print(tasks.map((t) {
      t.toString();
    }));
    return tasks;
  }

  Future<Task> addTask(Task task) async {
    Database dbClient = await db;
    task.id = await dbClient.insert('tasks', task.toMap());
    print('task added to database: task id is ${task.id}');
    return task;
  }

  Future<void> close() async {
    Database dbClient = await db;
    await dbClient.close();
  }
}
