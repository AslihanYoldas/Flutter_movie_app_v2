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
      final response = await  _repository.fetchSearchResult(q);

      emit(ResponseState(response!));
    }

    catch (e) {
      debugPrint('ERROR : ${e.toString()}');
      emit(ErrorState(e.toString()));
    }
  }
}