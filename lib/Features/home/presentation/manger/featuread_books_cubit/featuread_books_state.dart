part of 'featuread_books_cubit.dart';

@immutable
abstract class FeatureadBooksState {}

class FeatureadBooksInitial extends FeatureadBooksState {}

class FeatureadBooksLoading extends FeatureadBooksState {}

class FeatureadBooksSuccess extends FeatureadBooksState {
  final List<BookEntity> books;

  FeatureadBooksSuccess({required this.books});
}

class FeatureadBooksFailure extends FeatureadBooksState {
  final String errorMessage;

  FeatureadBooksFailure({required this.errorMessage});
}
