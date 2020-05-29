import 'package:complex_api_demo/data/local/post_dao.dart';
import 'package:complex_api_demo/data/local/post_table.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

@UseMoor(
  tables: [LocalPosts],
  daos: [PostDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: 'thihatech.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;
}
