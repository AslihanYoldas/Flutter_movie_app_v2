import 'dart:convert';
import 'package:flutter_movieapi_v2/model/news.dart';
import 'package:flutter_movieapi_v2/model/search_result.dart';
import 'package:flutter_movieapi_v2/model/upcoming_movies.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/movie_detail.dart';
import '../model/popular_movies.dart';
import '../model/review.dart';

part 'movie_api.g.dart';

@RestApi(baseUrl: 'https://flixster.p.rapidapi.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET("/search")
  Future<SearchResult> getSearchResult( @Query('query') String query);
  @GET("/reviews/list")
  Future<Review> getReview( @Query('emsId') String query,{limit: '20',offset: '0',withComments: 'true'});
  @GET("/news/list")
  Future<News> getNews();
  @GET("/movies/detail")
  Future<MovieDetail> getMovieDetail( @Query('emsVersionId') String query);
  @GET("/movies/get-popularity")
  Future<PopularMovies> getPopularMovies();
  @GET("/movies/get-upcoming")
  Future<UpcomingMovies> getUpcomingMovies( );

}