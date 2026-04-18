import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:flutter/material.dart';

part 'featuread_books_state.dart';

class FeatureadBooksCubit extends Cubit<FeatureadBooksState> {
  FeatureadBooksCubit(this.fetchFeaturedBooksUseCase) : super(FeatureadBooksInitial());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(FeatureadBooksLoading());
    final result = await fetchFeaturedBooksUseCase.call();
    result.fold(
      (failure) => emit(FeatureadBooksFailure(errorMessage: failure.message)),
      (books) => emit(FeatureadBooksSuccess(books: books)),
    );
  }
}
