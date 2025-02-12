import 'package:dio/dio.dart';
import 'package:flutter_dio_app/features/home/data/data_sources/api_service.dart';
import 'package:flutter_dio_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_dio_app/features/home/domain/repositories/home_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_dio_app/core/interceptor_app.dart';

final service = GetIt.instance;

Future<void> init() async {
  service.registerLazySingleton(() => Dio(BaseOptions(
      baseUrl: 'https://api.api-ninjas.com/v1/',
    ))..interceptors.addAll([
      InterceptorApp(),
      PrettyDioLogger(),
    ])
  );

  service.registerLazySingleton<ApiService>(() => ApiService());
  service.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(service<ApiService>()));
}
