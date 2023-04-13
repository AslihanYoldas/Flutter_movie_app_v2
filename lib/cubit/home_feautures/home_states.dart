import 'package:flutter_movieapi_v2/model/upcoming_movies.dart';
import '../../model/news.dart';
import 'package:flutter_movieapi_v2/model/popular_movies.dart';

abstract class HomeStates{}

class InitState extends HomeStates {
}
class LoadingState  extends HomeStates{
}
class ErrorState extends HomeStates{
  final String message;
  ErrorState(this.message);
}
//This state responsible for holding the response
class ResponseState extends HomeStates{
  News news;
  PopularMovies popular;
  UpcomingMovies upcoming;
  ResponseState (this.news,this.popular,this.upcoming);
}



