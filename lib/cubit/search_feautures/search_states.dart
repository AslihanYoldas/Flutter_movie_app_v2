import '../../model/search_result.dart';

abstract class SearchStates{}

class InitState extends SearchStates {
}
class LoadingState  extends SearchStates{
}
class ResponseState extends SearchStates{
  SearchResult? searchResult;
  ResponseState(this.searchResult);
}
class ErrorState extends SearchStates{
  final String message;
  ErrorState(this.message);
}