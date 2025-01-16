// ignore_for_file: cascade_invocations

import 'package:dio/dio.dart';
import 'package:fenix_mobile_case/common/constants/application/application.dart';
import 'package:fenix_mobile_case/core/logger/app_logger.dart';
import 'package:fenix_mobile_case/core/network/manager/network_client.dart';
import 'package:fenix_mobile_case/features/movies/data/repositories/movies_repository.dart';
import 'package:fenix_mobile_case/features/movies/data/services/movies_service.dart';
import 'package:fenix_mobile_case/features/movies/domain/repository/i_movies_repository.dart';
import 'package:fenix_mobile_case/features/movies/domain/services/i_movies_service.dart';
import 'package:fenix_mobile_case/features/movies/presentation/cubit/movies_cubit.dart';
import 'package:get_it/get_it.dart';
final _serviceLocator = GetIt.instance;

Future<void> initalize() async {
  // #Network
  _serviceLocator
    .registerSingleton<Dio>(
      Dio(
        BaseOptions(
          baseUrl: Application.apiBaseUrl,
          contentType: 'application/json',
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(minutes: 1),
          receiveTimeout: const Duration(minutes: 1),
        ),
      ),
    );

   _serviceLocator
    .registerLazySingleton(
          () => NetworkClient(
        dio: _serviceLocator<Dio>(),
      ),
    );

   //movies
  _serviceLocator..registerLazySingleton<IMoviesService>(()=>MoviesService(_serviceLocator<NetworkClient>()))
  ..registerLazySingleton<IMoviesRepository>(()=>MoviesRepository(_serviceLocator<IMoviesService>()))
  ..registerLazySingleton<MoviesCubit>(()=>MoviesCubit(_serviceLocator<IMoviesRepository>()))
  ;

  AppLogger.call(title: 'Service Locator Initialized');
}

Future<void> _initializeOtherDependencies() async {

}

GetIt get getServiceLocator {
  return _serviceLocator;
}

T provide<T extends Object>() {
  return _serviceLocator<T>();
}
