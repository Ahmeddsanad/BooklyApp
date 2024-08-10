import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks();
<<<<<<< HEAD
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
=======
  Future<List<BookEntity>> fetchNewestBooks();
>>>>>>> f8c6d16c5920755a4b40b86ac893f5dd1fff9b0f
}
