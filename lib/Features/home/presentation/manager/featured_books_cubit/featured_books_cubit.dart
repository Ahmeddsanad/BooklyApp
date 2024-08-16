import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/domain/use%20cases/fetch_featured_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await featuredBooksUseCase.call(pageNumber);

    result.fold(
      (l) {
        if (pageNumber == 0) {
          emit(FeaturedBooksFailure(l.message));
        } else {
          emit(FeaturedBooksPaginationFailure(l.message));
        }
      },
      (books) {
        emit(FeaturedBooksSuccess(books));
      },
    );
  }
}
