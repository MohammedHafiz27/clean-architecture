import 'package:dio/dio.dart';

class ApiService {
  static const String kBaseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  ApiService(this._dio) {
    _dio.options.baseUrl = kBaseUrl;
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get(endPoint);
    return response.data;
  }
}
