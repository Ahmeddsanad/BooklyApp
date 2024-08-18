import 'package:bookly/Features/home/domain/entites/book_entity.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({
    super.key,
    required this.books,
  });

  final BookEntity books;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          bookData: books,
        ),
      ),
    );
  }
}
