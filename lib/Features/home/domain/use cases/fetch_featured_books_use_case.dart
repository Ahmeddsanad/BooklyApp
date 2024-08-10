import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(
    this.homeRepo,
  );

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    //Method Body
    return homeRepo.fetchFeaturedBooks();
  }
}
