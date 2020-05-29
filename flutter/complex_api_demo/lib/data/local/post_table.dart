import 'package:moor_flutter/moor_flutter.dart';

class LocalPosts extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime().nullable()();
  TextColumn get slug => text()();
  TextColumn get title => text()();
  TextColumn get status => text()();
  TextColumn get image => text()();
  IntColumn get page => integer()();
  IntColumn get perPage => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
