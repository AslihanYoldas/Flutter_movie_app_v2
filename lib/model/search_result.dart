// To parse this JSON data, do
//
//     final searchResult = searchResultFromJson(jsonString);

import 'dart:convert';

SearchResult searchResultFromJson(String str) => SearchResult.fromJson(json.decode(str));

String searchResultToJson(SearchResult data) => json.encode(data.toJson());

class SearchResult {
  SearchResult({
    required this.data,
  });

  Data data;

  factory SearchResult.fromJson(dynamic json) => SearchResult(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.search,
  });

  Search search;

  factory Data.fromJson(dynamic json) => Data(
    search: Search.fromJson(json["search"]),
  );

  Map<String, dynamic> toJson() => {
    "search": search.toJson(),
  };
}

class Search {
  Search({
    required this.movies,
    //required this.people,
    //required this.theaters,
  });

  List<Movie> movies;
  //List<dynamic> people;
  //List<dynamic> theaters;

  factory Search.fromJson(dynamic json) => Search(
    movies: List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
    //people: List<dynamic>.from(json["people"].map((x) => x)),
    //theaters: List<dynamic>.from(json["theaters"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "movies": List<dynamic>.from(movies.map((x) => x.toJson())),
    //"people": List<dynamic>.from(people.map((x) => x)),
    //"theaters": List<dynamic>.from(theaters.map((x) => x)),
  };
}

class Movie {
  Movie({
    required this.emsId,
    required this.emsVersionId,
    required this.name,
    this.posterImage,
    //this.tomatoRating,
    required this.userRating,
  });

  String? emsId;
  String? emsVersionId;
  String? name;
  image? posterImage;
  //dynamic tomatoRating;
  UserRating? userRating;

  factory Movie.fromJson(dynamic json) => Movie(
    emsId: json["emsId"],
    emsVersionId: json["emsVersionId"],
    name: json["name"],
    posterImage: json["posterImage"] == null ? null : image.fromJson(json["posterImage"]),
    //tomatoRating: json["tomatoRating"],
    userRating: UserRating.fromJson(json["userRating"]),
  );

  Map<String, dynamic> toJson() => {
    "emsId": emsId,
    "emsVersionId": emsVersionId,
    "name": name,
    "posterimage": posterImage?.toJson(),
    // "tomatoRating": tomatoRating,
    "userRating": userRating?.toJson(),
  };
}

class image {
  image({
    required this.url,
  });

  String? url;

  factory image.fromJson(dynamic json) => image(
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
  };
}

class UserRating {
  UserRating(
      //this.dtlLikedScore,
      //this.dtlWtsScore,
      //required this.iconimage,
      );


  //int? dtlLikedScore;
  // dtlWtsScore;
  //image? iconimage;

  factory UserRating.fromJson(dynamic json) => UserRating(
    //dtlLikedScore: json["dtlLikedScore"],
    //dtlWtsScore: json["dtlWtsScore"],
    //iconimage: image.fromJson(json["iconimage"]),
  );

  dynamic toJson() => {
    //"dtlLikedScore": dtlLikedScore,
    //"dtlWtsScore": dtlWtsScore,
    //"iconimage": iconimage?.toJson(),
  };
}
