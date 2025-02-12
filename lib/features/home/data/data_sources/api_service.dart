import 'package:dio/dio.dart';
import 'package:flutter_dio_app/interceptor.dart';

class ApiService {
  final Dio dio = service<Dio>();

  Future<Response> fetchData(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw Exception('Ошибка загрузки данных: $e');
    }
  }
}

