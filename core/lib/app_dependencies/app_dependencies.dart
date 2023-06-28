import 'package:data/api/food_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:use_cases/food_use_case/food_use_case.dart';

GetIt injection = GetIt.I;

class AppDependencies {
  static final AppDependencies instance = AppDependencies._();

  factory AppDependencies() => instance;

  AppDependencies._();

  Future<void> setDependencies() async {
    final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://gist.githubusercontent.com',
      contentType: 'application/json',
    ));

    injection.registerLazySingleton<FoodRepository>(
      () => FoodRepositoryImpl(dio),
    );

    injection.registerLazySingleton<FoodUseCase>(
      () => FoodUseCaseImpl(injection()),
    );
  }
}
