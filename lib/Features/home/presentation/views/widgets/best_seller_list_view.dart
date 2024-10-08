import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      // padding: EdgeInsets.zero,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              BookListViewItem(
                bookData: books[index],
              ),
            ],
          ),
        );
      },
    );
  }
}
