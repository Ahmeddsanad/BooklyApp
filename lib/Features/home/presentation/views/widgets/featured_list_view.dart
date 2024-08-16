import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<BookEntity> books;

  @override
  State<StatefulWidget> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // Calculate the position when 70% of the widget is visible
    double maxPosition = _scrollController.position.maxScrollExtent * 0.7;
    double currentPosition = _scrollController.position.pixels;
    if (currentPosition >= maxPosition) {
      // Perform your action when the scroll position is at or beyond 70%
      print('Reached 70% of the list view!');
      BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks();
      _scrollController.removeListener(_onScroll);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomBookImage(
              image: widget.books[index].image ??
                  'https://m.media-amazon.com/images/I/71uN0nVAkvL._AC_UF1000,1000_QL80_.jpg',
            ),
          );
        },
      ),
    );
  }
}
