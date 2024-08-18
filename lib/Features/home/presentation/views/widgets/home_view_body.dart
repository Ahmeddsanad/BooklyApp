import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view_bloc_consumer.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_books_list_view_bloc_Consumer.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: CustomAppBar(),
                ),
                FeaturedBooksListViewBlocConsumer(),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Newest Books',
                    style: Styles.textStyle18,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ];
      },
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: BestSellerListViewBlocConsumer(),
      ),
    );
  }
}
