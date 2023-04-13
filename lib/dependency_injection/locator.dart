import 'package:dio/dio.dart';
import 'package:flutter_movieapi_v2/cubit/search_feautures/search_cubit.dart';
import 'package:flutter_movieapi_v2/repository/repository.dart';
import 'package:get_it/get_it.dart';
import '../api/movie_api.dart';
import '../cubit/movie_features/movie_cubit.dart';
import '../utils/constants.dart';
import '../cubit/home_feautures/home_cubit.dart';
final locator=GetIt.instance;

class DependencyInjection{

  DependencyInjection(){
    provideApi();
    provideRepositories();
    provideViewModels();

  }
  void provideApi(){
    locator.registerLazySingleton<RestClient>(() => RestClient(Dio(BaseOptions(contentType: 'application/json',headers: {
      'X-RapidAPI-Key': Constant.KEY,
      'X-RapidAPI-Host': Constant.BASE_URL,
    }
    )))
    );
  }

  void provideRepositories(){
    locator.registerLazySingleton<Repository>(() => Repository());
  }

  void provideViewModels(){
    locator.registerLazySingleton<HomeCubit>(() => HomeCubit());
    locator.registerLazySingleton<MovieCubit>(() => MovieCubit());
    locator.registerLazySingleton<SearchCubit>(() => SearchCubit());

  }

}