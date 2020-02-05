import 'package:book_moor/data/database.dart';
import 'package:moor_flutter/moor_flutter.dart';

@DataClassName('BookCategory')
class BookCategories extends Table {
  final Book book;
  final Category category;

  BookCategories({this.book, this.category});

}
