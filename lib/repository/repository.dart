
import 'package:flutter/cupertino.dart';
import 'package:flutter_movieapi_v2/dependency_injection/locator.dart';
import 'package:flutter_movieapi_v2/model/movie_detail.dart';
import 'package:flutter_movieapi_v2/model/popular_movies.dart';
import 'package:flutter_movieapi_v2/model/review.dart';
import 'package:flutter_movieapi_v2/model/search_result.dart';
import 'package:flutter_movieapi_v2/model/upcoming_movies.dart';
import '../api/movie_api.dart';
import '../model/news.dart';


class Repository {

  final _api = locator.get<RestClient>();


  Future<SearchResult?> fetchSearchResult(String q) async {
    try{
      debugPrint('Repo $q');
      SearchResult? response= await _api.getSearchResult(q);
      debugPrint('Repo ${response.data.search.movies[0].name}');

      return response;

    }
    catch(e){
      debugPrint('SEARCH ERROR :  ${e.toString()}');
      return null;
    }
  }
  Future<Review?> fetchReview(q) async {
    try{
      debugPrint(q);
      Review data= await _api.getReview(q);

      return data;
    }
    catch(e){
      debugPrint('REVİEW Repo ERROR : ${e.toString()} ');
      return null;
    }
  }
  Future<News?> fetchNews() async {
    try{
      News data= await _api.getNews();
      debugPrint('$data' );
      return data;
    }
    catch(e){
      debugPrint(' NEWS Repo ERROR : ${e.toString()}');
      return null;
    }
  }

  Future<PopularMovies?> fetchPopularMovies() async {
    try{
      PopularMovies data= (await _api.getPopularMovies());
      return data;
    }
    catch(e){
      debugPrint(' Popular Movie Repo ERROR : ${e.toString()}');
      return null;
    }
  }
  Future<UpcomingMovies?> fetchUpcomingMovies() async {
    try{
      UpcomingMovies data= (await _api.getUpcomingMovies());
      return data;
    }
    catch(e){
      debugPrint('Upcoming Movie Repo ERROR : ${e.toString()}');
      return null;
    }
  }

  Future<MovieDetail?>  fetchMovieDetail( String detailId) async {
    try{
      debugPrint(detailId);
      MovieDetail data= (await _api.getMovieDetail(detailId));
      debugPrint(data.data?.movie?.name);
      return data;
    }
    catch(e){
      debugPrint('Movie Detail Repo ERROR : ${e.toString()}');
      return null;
    }
  }

  }




