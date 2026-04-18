import 'package:bookly/Features/home/presentation/manger/featuread_books_cubit/featuread_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListViewBlocBuilder extends StatelessWidget {
  const FeaturedBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureadBooksCubit, FeatureadBooksState>(
      builder: (context, state) {
        if (state is FeatureadBooksSuccess) {
          return FeaturedBooksListView(
            books: state.books,
          );
        } else if (state is FeatureadBooksFailure) {
          return const Center(child: Text('Failed to load featured books'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
