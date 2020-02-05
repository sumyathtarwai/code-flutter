import 'package:moor_flutter/moor_flutter.dart';

class Authors extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get authorName => text().withLength(min: 2, max: 100)();
}
