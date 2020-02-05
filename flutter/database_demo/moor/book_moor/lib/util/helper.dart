import 'package:book_moor/data/database.dart';

class DatabaseHelper {
  // singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._private();

  DatabaseHelper._private();
  factory DatabaseHelper() => _instance;

  static AppDatabase _db;

  AppDatabase get db {
    if (_db != null) {
      return _db;
    }
    _db = AppDatabase();

    return _db;
  }
}
