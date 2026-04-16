import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call([Params param]);
}

class NoParams {}
