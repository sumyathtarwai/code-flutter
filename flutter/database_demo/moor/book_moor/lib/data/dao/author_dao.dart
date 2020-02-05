import 'package:book_moor/data/database.dart';
import 'package:book_moor/data/model/authors_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'author_dao.g.dart';

@UseDao(tables: [Authors])
class AuthorDao extends DatabaseAccessor<AppDatabase> with _$AuthorDaoMixin {
  final AppDatabase db;
  AuthorDao(this.db) : super(db);

  Future<List<Author>> getAllAuthors() => select(authors).get();
  Stream<List<Author>> watchAllAuthors() => select(authors).watch();
  Future insertAuthor(Author author) => into(authors).insert(author);
  Future updateAuthor(Author author) => update(authors).replace(author);
  Future deleteAuthor(Author author) => delete(authors).delete(author);
}
