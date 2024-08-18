import 'package:bookly/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewBlocConsumer extends StatelessWidget {
  const BestSellerListViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return BestSellerListView(books: state.books);
        } else if (state is NewestBooksFailure) {
          return Text(state.errMessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
      listener: (context, state) {},
    );
  }
}
