import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../dependency_injection/locator.dart';
import '../../repository/repository.dart';
import 'search_states.dart';
class SearchCubit extends Cubit<SearchStates> {
  final _repository = locator.get<Repository>();

  SearchCubit() :super(InitState());

  Future<void> fetchSearchResults(q)   async {
    emit(LoadingState());
    try {
      debugPrint('Search cubit query :$q' );
      final response = await  _repository.fetchSearchResult(q);
      debugPrint('Cevap geldi $response');
      debugPrint('Cevap geldi ${response?.data.search.movies[0].name}');
      emit(ResponseState(response!));
    }

    catch (e) {
      debugPrint('ERROR : ${e.toString()}');
      emit(ErrorState(e.toString()));
    }
  }
}