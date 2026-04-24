part of 'featuread_books_cubit.dart';

@immutable
abstract class FeatureadBooksState {}

class FeatureadBooksInitial extends FeatureadBooksState {}

class FeatureadBooksLoading extends FeatureadBooksState {}

class FeatureadBooksPaginationLoading extends FeatureadBooksState {}

class FeatureadBooksPaginationFailure extends FeatureadBooksState {
  final String errorMessage;

  FeatureadBooksPaginationFailure({required this.errorMessage});
}

class FeatureadBooksSuccess extends FeatureadBooksState {
  final List<BookEntity> books;

  FeatureadBooksSuccess({required this.books});
}

class FeatureadBooksFailure extends FeatureadBooksState {
  final String errorMessage;

  FeatureadBooksFailure({required this.errorMessage});
}
