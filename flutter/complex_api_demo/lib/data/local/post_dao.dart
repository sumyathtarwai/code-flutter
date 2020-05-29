import 'package:complex_api_demo/data/local/database.dart';
import 'package:complex_api_demo/data/local/post_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'post_dao.g.dart';

@UseDao(tables: [LocalPosts])
class PostDao extends DatabaseAccessor<AppDatabase> with _$PostDaoMixin {
  final AppDatabase db;
  PostDao(this.db) : super(db);

  Future<List<LocalPost>> getAllLocalPosts() => select(localPosts).get();
  Stream<List<LocalPost>> watchAllLocalPosts() => select(localPosts).watch();
  Future insertLocalPosts(LocalPost post) => into(localPosts).insert(post);

  Future<List<LocalPost>> getLocalPostsByPage(int page) {
    return (select(localPosts)..where((t) => t.page.equals(page))).get();
  }

  Future<void> insertAllLocalPosts(List<LocalPost> entries) async {
    await batch((batch) {
      batch.insertAll(localPosts, entries, mode: InsertMode.insertOrIgnore);
    });
  }

  // Future updateBook(BoLocalPostok book) => update(books).replace(book);
  // Future deleteBook(LocalPost book) => delete(books).delete(book);
}
