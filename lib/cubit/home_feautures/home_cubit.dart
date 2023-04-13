
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movieapi_v2/dependency_injection/locator.dart';
import '../../repository/repository.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates>{
  final _repository= locator.get<Repository>();
  HomeCubit():super(InitState());

  //Doing API call using repository
  Future<void>fetchHomePage() async{
    emit(LoadingState());
    try{

      final responseNews= await _repository.fetchNews();
      final responsePopular= await _repository.fetchPopularMovies();
      final responseUpcoming= await _repository.fetchUpcomingMovies();
      emit(ResponseState(responseNews!,responsePopular!,responseUpcoming!));
    }
    catch(e){
      debugPrint('ERROR : ${e.toString()}');
      emit(ErrorState(e.toString()));
    }

  }
}







