import 'package:flutter_dio_app/features/home/data/data_sources/api_service.dart';
import 'package:flutter_dio_app/features/home/data/models/swiftcode_model.dart';
import 'package:flutter_dio_app/features/home/domain/repositories/home_repository.dart';
import 'package:flutter_dio_app/features/home/data/data_sources/home_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
      
   final ApiService apiService;

   HomeRepositoryImpl(this.apiService);

  Future<List<SwiftCodeModel>> getSwiftCodes() async {
    final response = await apiService.fetchData('/swiftcode', queryParameters: {
      "bank": "Silicon Valley Bank"
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((json) => SwiftCodeModel.fromJson(json)).toList();
    } else {
      throw Exception('Ошибка загрузки swift кода');
    }
  }
}