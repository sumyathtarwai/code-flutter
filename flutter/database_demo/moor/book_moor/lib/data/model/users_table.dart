import 'package:moor_flutter/moor_flutter.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userName => text().withLength(min: 2, max: 100)();
  TextColumn get password => text().withLength(min: 2, max: 100)();
  TextColumn get address => text().withLength(min: 2, max: 300)();
  TextColumn get phone => text().withLength(min: 2, max: 100)();
  BoolColumn get valid => boolean().withDefault(Constant(true))();
  TextColumn get role => text().withLength(min: 2, max: 50)();
}
