import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceimpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var books = Hive.box<BookEntity>(kFeaturedBox);
    return books.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var books = Hive.box<BookEntity>(kNewestBox);

    return books.values.toList();
  }
}
