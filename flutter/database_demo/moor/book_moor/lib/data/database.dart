import 'package:book_moor/data/dao/author_dao.dart';
import 'package:book_moor/data/dao/book_dao.dart';
import 'package:book_moor/data/dao/category_dao.dart';
import 'package:book_moor/data/dao/user_dao.dart';
import 'package:book_moor/data/model/authors_table.dart';
import 'package:book_moor/data/model/books_table.dart';
import 'package:book_moor/data/model/categories_table.dart';
import 'package:book_moor/data/model/users_table.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

@UseMoor(
  tables: [
    Books,
    Authors,
    Categories,
    Users,
  ],
  daos: [
    BookDao,
    AuthorDao,
    UserDao,
    CategoryDao,
  ],
)
class AppDatabase extends _$AppDatabase {

  
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'book.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
