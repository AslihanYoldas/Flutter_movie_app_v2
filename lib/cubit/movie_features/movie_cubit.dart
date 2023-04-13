import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection/locator.dart';
import '../../repository/repository.dart';
import 'movie_states.dart';

class MovieCubit extends Cubit<MovieStates> {
  final _repository = locator.get<Repository>();

  MovieCubit() :super(InitState());

  Future<void> fetchMovie(String reviewid, String detailid) async {
    emit(LoadingState());
    try {
      final responseReview = await _repository.fetchReview(reviewid);
      final responseDetail = await _repository.fetchMovieDetail(detailid);


      emit(ResponseState(responseDetail!, responseReview!));
    }
    catch (e) {
      debugPrint('ERROR : ${e.toString()}');


    }
  }
}