import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/model/user_table.dart';

class DatabaseHelper {
  // singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._private();

  DatabaseHelper._private();
  factory DatabaseHelper() => _instance;

  static Database _db;
  final String userTable = 'user';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnPassword = 'password';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    print(_db.path);

    return _db;
  }

  initDb() async {
    // path provider help it
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = join(appDocDir.path, 'sqfliteTodo.db');
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);
    print(path);
    return database;
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $userTable($columnId INTEGER PRIMARY KEY, $columnName TEXT, $columnPassword TEXT)');
  }

  Future<int> getCount() async {
    var database = await db;
    return Sqflite.firstIntValue(
      await database.rawQuery('SELECT COUNT(*) FROM $userTable'),
    );
  }

// get one
  Future<Users> getUserById(int id) async {
    var database = await db;
    var result =
        await database.rawQuery('SELECT * FROM $userTable WHERE $columnId=$id');
    if (result.length == 0) return null;
    return Users.mapMapper(result.first);
  }

// get list
  Future<List<Map<String, dynamic>>> getAllUser() async {
    var database = await db;
    return await database.rawQuery('SELECT * FROM $userTable');
  }

// save
  Future<int> insertUser(Users user) async {
    var database = await db;
    return await database.insert(userTable, user.toMap());
  }

  // delete where id
  Future<int> deleteUser(int id) async {
    var database = await db;
    return await database
        .delete(userTable, where: '$columnId=?', whereArgs: [id]);
  }

  Future<int> updateUser(Users user) async {
    var database = await db;
    return await database.update(userTable, user.toMap(),
        where: '$columnId=?', whereArgs: [user.id]);
  }

  Future close() async {
    var database = await db;
    return database.close();
  }
}
