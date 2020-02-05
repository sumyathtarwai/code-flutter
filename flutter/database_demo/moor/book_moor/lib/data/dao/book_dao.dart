import 'package:book_moor/data/database.dart';
import 'package:book_moor/data/model/books_table.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'book_dao.g.dart';

@UseDao(tables: [Books])
class BookDao extends DatabaseAccessor<AppDatabase> with _$BookDaoMixin {
  final AppDatabase db;
  BookDao(this.db) : super(db);

  Future<List<Book>> getAllBooks() => select(books).get();
  Stream<List<Book>> watchAllBooks() => select(books).watch();
  Future insertBook(Book book) => into(books).insert(book);
  Future updateBook(Book book) => update(books).replace(book);
  Future deleteBook(Book book) => delete(books).delete(book);
}
