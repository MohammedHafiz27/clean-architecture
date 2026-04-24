import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featuread_books_state.dart';

class FeatureadBooksCubit extends Cubit<FeatureadBooksState> {
  FeatureadBooksCubit(this.fetchFeaturedBooksUseCase) : super(FeatureadBooksInitial());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeatureadBooksLoading());
    } else {
      emit(FeatureadBooksPaginationLoading());
    }
    final result = await fetchFeaturedBooksUseCase.call(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(FeatureadBooksFailure(errorMessage: failure.message));
        } else {
          emit(FeatureadBooksPaginationFailure(errorMessage: failure.message));
        }
      },
      (books) => emit(FeatureadBooksSuccess(books: books)),
    );
  }
}
