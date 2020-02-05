import 'package:book_moor/data/database.dart';
import 'package:book_moor/data/model/categories_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'category_dao.g.dart';

@UseDao(tables: [Categories])
class CategoryDao extends DatabaseAccessor<AppDatabase> with _$CategoryDaoMixin {
  final AppDatabase db;
  CategoryDao(this.db) : super(db);

  Future<List<Category>> getAllCategories() => select(categories).get();
  Stream<List<Category>> watchAllCategories() => select(categories).watch();
  Future insertCategory(Category category) => into(categories).insert(category);
  Future updateCategory(Category category, {id}) => update(categories).replace(category);
  Future deleteCategory(Category category) => delete(categories).delete(category);
}
