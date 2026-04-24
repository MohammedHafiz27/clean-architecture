import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manger/featuread_books_cubit/featuread_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_books_list_view_loading.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() => _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureadBooksCubit, FeatureadBooksState>(
      builder: (context, state) {
        if (state is FeatureadBooksSuccess ||
            state is FeatureadBooksPaginationLoading ||
            state is FeatureadBooksPaginationFailure) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeatureadBooksFailure) {
          return const Center(child: Text('Failed to load featured books'));
        } else {
          return FeaturedBooksListViewLoading();
        }
      },
      listener: (BuildContext context, FeatureadBooksState state) {
        if (state is FeatureadBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeatureadBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
          ));
        }
      },
    );
  }
}
