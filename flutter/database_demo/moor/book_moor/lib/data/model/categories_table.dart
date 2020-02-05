import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get categoryName => text().withLength(min: 2, max: 100)();
}
