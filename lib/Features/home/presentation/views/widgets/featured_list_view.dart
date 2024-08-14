import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({
    Key? key,
    required this.books,
  }) : super(key: key);

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImage(
                image: books[index].image ??
                    'https://m.media-amazon.com/images/I/71uN0nVAkvL._AC_UF1000,1000_QL80_.jpg',
              ),
            );
          }),
    );
  }
}
