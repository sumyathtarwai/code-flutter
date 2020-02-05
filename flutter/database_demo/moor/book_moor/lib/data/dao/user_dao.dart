import 'package:book_moor/data/database.dart';
import 'package:book_moor/data/model/users_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'user_dao.g.dart';

@UseDao(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  final AppDatabase db;
  UserDao(this.db) : super(db);

  Future<List<User>> getAllUsers() => select(users).get();
  Stream<List<User>> watchAllUsers() => select(users).watch();
  Future insertUser(User user) => into(users).insert(user);
  Future updateUser(User user) => update(users).replace(user);
  Future deleteUser(User user) => delete(users).delete(user);
}
