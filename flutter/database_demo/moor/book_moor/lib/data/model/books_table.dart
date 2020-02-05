import 'package:moor_flutter/moor_flutter.dart';

class Books extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 2, max: 100)();
  TextColumn get description => text().withLength(min: 2, max: 200)();
  RealColumn get price => real().nullable().withDefault(Constant(0.0))();
  DateTimeColumn get publishedDate =>
      dateTime().nullable().withDefault(Constant(DateTime.now()))();
}
