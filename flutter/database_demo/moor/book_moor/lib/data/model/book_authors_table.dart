import 'package:moor_flutter/moor_flutter.dart';
import 'package:book_moor/data/database.dart';

class BookAuthors extends Table {
  final Book book;
  final Author author;

  BookAuthors({this.book, this.author});
}
