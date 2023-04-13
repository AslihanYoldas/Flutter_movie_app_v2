


import '../../model/movie_detail.dart';
import '../../model/review.dart';

abstract class MovieStates{}

class InitState extends MovieStates {
}
class LoadingState  extends MovieStates{
}
class ResponseState extends MovieStates{
  MovieDetail detail;
  Review review;
  ResponseState(this.detail,this.review);
}
class ErrorState extends MovieStates{
  final String message;
  ErrorState(this.message);
}