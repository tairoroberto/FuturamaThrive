import 'package:dio/dio.dart';
import 'package:futurama_thrive/app/core/services/rest_client.dart';
import 'package:futurama_thrive/app/modules/characters/characters_controller.dart';
import 'package:futurama_thrive/app/modules/home/home_controller.dart';
import 'package:futurama_thrive/app/modules/home/home_repository.dart';
import 'package:futurama_thrive/app/modules/quiz/quiz_controller.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator({RestClient? client}) {
  serviceLocator
      .registerLazySingleton<RestClient>(() => client ?? RestClient(Dio()));
  serviceLocator.registerLazySingleton<HomeRepository>(
      () => HomeRepository(serviceLocator<RestClient>()));

  serviceLocator.registerLazySingleton<HomeController>(() => HomeController());
  serviceLocator.registerLazySingleton<CharactersController>(
      () => CharactersController());
  serviceLocator.registerLazySingleton<QuizController>(() => QuizController());
}
