import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.fetchNewestBooksUseCase) : super(NewsetBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks() async {
    emit(NewsetBooksLoading());
    final result = await fetchNewestBooksUseCase.call();
    result.fold(
      (failure) => emit(NewsetBooksFailure(errorMessage: failure.message)),
      (books) => emit(NewsetBooksSuccess(books: books)),
    );
  }
}
