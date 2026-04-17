import 'package:dio/dio.dart';

class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: 'Connection timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: 'Send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: 'Receive timeout');
      case DioExceptionType.badResponse:
        return ServerFailure.fromStatusCode(dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(message: 'Request cancelled');
      case DioExceptionType.unknown:
      default:
        return ServerFailure(message: 'Unexpected error occurred');
    }
  }

  factory ServerFailure.fromStatusCode(int statusCode, dynamic data) {
    switch (statusCode) {
      case 400:
        return ServerFailure(message: 'Bad request, ${data['error']['message']}');
      case 401:
        return ServerFailure(message: 'Unauthorized, ${data['error']['message']}');
      case 403:
        return ServerFailure(message: 'Forbidden, ${data['error']['message']}');
      case 404:
        return ServerFailure(message: 'Your request was Not found');
      case 500:
        return ServerFailure(message: 'Internal server error');
      default:
        return ServerFailure(message: 'There is an error with status code: $statusCode');
    }
  }
}

class CacheFailure extends Failure {
  CacheFailure({required super.message});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message});
}
