import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manger/featuread_books_cubit/featuread_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  late ScrollController scrollController;
  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      var currentPosition = scrollController.position.pixels;
      var maxScrollLength = 0.7 * scrollController.position.maxScrollExtent;
      if (currentPosition >= maxScrollLength) {
        context.read<FeatureadBooksCubit>().fetchFeaturedBooks();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          controller: scrollController,
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImage(
                img: widget.books[index].image ??
                    "https://www.lulu.com/create?srsltid=AfmBOoprQ_BihUcCVLnqwwwv_z4Aecoj-KaxNUFFXAqLmpVbyvqSVWbn",
              ),
            );
          }),
    );
  }
}
