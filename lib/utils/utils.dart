import 'package:flutter/material.dart';
import 'package:flutter_movieapi_v2/model/movie_detail.dart';

import '../model/news.dart';
import '../model/popular_movies.dart';
import '../model/upcoming_movies.dart';
import 'modifed_text.dart';

Center buildLoading() {
  return const Center(

    child: CircularProgressIndicator(
      color: Colors.green,

    ),
  );
}

Widget getName(MovieDetail detail) {
  int strLen = detail.data?.movie?.name?.length ?? 0;
  if (strLen > 60) {
    return modified_text(
      text: detail.data?.movie?.name ?? '',
      size: 20,
      color: Colors.white,
    );
  } else {
    return modified_text(
      text: detail.data?.movie?.name ?? '',
      size: 30,
      color: Colors.white,
    );
  }
}

String getGenre(MovieDetail detail) {
  int len = detail.data?.movie?.genres?.length ?? 0;
  String genre = "";
  for (var i = 0; i < len; i++) {
    genre += '${detail.data?.movie?.genres?[i].name} ';
    debugPrint(genre);
  }
  return genre;
}

String? getTitle(News news,int index){

  String? text=news.data?.newsStories?[index].title;
  debugPrint(text);
  text=text?.replaceAll(RegExp(r'<em>'), '');
  text=text?.replaceAll(RegExp(r'</em>'), '');
  text=text?.replaceAll(RegExp(r'<I>'), '');
  text=text?.replaceAll(RegExp(r'</i>'), '');
  text=text?.replaceAll(RegExp(r'&#\d*;'), ' ');
  text=text?.replaceAll(RegExp(r'&\w*;'), ' ');
  debugPrint(text);

  return text;
}

