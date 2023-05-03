class PopularMovies {
  Data? data;

  PopularMovies({this.data});

  PopularMovies.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Popularity>? popularity;
  List<Opening>? opening;

  Data({this.popularity, this.opening});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['popularity'] != null) {
      popularity = <Popularity>[];
      json['popularity'].forEach((v) {
        popularity!.add(new Popularity.fromJson(v));
      });
    }
    if (json['opening'] != null) {
      opening = <Opening>[];
      json['opening'].forEach((v) {
        opening!.add(new Opening.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.popularity != null) {
      data['popularity'] = this.popularity!.map((v) => v.toJson()).toList();
    }
    if (this.opening != null) {
      data['opening'] = this.opening!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Popularity {
  String? emsId;
  String? emsVersionId;
  String? name;
  int? sortEms;
  int? sortPopularity;
  PosterImage? posterImage;
  TomatoRating? tomatoRating;
  UserRating? userRating;

  Popularity(
      {this.emsId,
        this.emsVersionId,
        this.name,
        this.sortEms,
        this.sortPopularity,
        this.posterImage,
        this.tomatoRating,
        this.userRating});

  Popularity.fromJson(Map<String, dynamic> json) {
    emsId = json['emsId'];
    emsVersionId = json['emsVersionId'];
    name = json['name'];
    sortEms = json['sortEms'];
    sortPopularity = json['sortPopularity'];
    posterImage = json['posterImage'] != null
        ? new PosterImage.fromJson(json['posterImage'])
        : null;
    tomatoRating = json['tomatoRating'] != null
        ? new TomatoRating.fromJson(json['tomatoRating'])
        : null;
    userRating = json['userRating'] != null
        ? new UserRating.fromJson(json['userRating'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emsId'] = this.emsId;
    data['emsVersionId'] = this.emsVersionId;
    data['name'] = this.name;
    data['sortEms'] = this.sortEms;
    data['sortPopularity'] = this.sortPopularity;
    if (this.posterImage != null) {
      data['posterImage'] = this.posterImage!.toJson();
    }
    if (this.tomatoRating != null) {
      data['tomatoRating'] = this.tomatoRating!.toJson();
    }
    if (this.userRating != null) {
      data['userRating'] = this.userRating!.toJson();
    }
    return data;
  }
}

class PosterImage {
  String? url;
  String? type;
  int? width;
  int? height;

  PosterImage({this.url, this.type, this.width, this.height});

  PosterImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['type'] = this.type;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class TomatoRating {
  int? tomatometer;
  IconImage? iconImage;

  TomatoRating({this.tomatometer, this.iconImage});

  TomatoRating.fromJson(Map<String, dynamic> json) {
    tomatometer = json['tomatometer'];
    iconImage = json['iconImage'] != null
        ? new IconImage.fromJson(json['iconImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tomatometer'] = this.tomatometer;
    if (this.iconImage != null) {
      data['iconImage'] = this.iconImage!.toJson();
    }
    return data;
  }
}

class IconImage {
  String? url;

  IconImage({this.url});

  IconImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class UserRating {
  int? dtlLikedScore;
  int? dtlWtsScore;
  IconImage? iconImage;

  UserRating({this.dtlLikedScore, this.dtlWtsScore, this.iconImage});

  UserRating.fromJson(Map<String, dynamic> json) {
    dtlLikedScore = json['dtlLikedScore'];
    dtlWtsScore = json['dtlWtsScore'];
    iconImage = json['iconImage'] != null
        ? new IconImage.fromJson(json['iconImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dtlLikedScore'] = this.dtlLikedScore;
    data['dtlWtsScore'] = this.dtlWtsScore;
    if (this.iconImage != null) {
      data['iconImage'] = this.iconImage!.toJson();
    }
    return data;
  }
}

class Opening {
  String? emsId;
  String? emsVersionId;
  String? name;
  PosterImage? posterImage;
  TomatoRating? tomatoRating;
  UserRating? userRating;

  Opening(
      {this.emsId,
        this.emsVersionId,
        this.name,
        this.posterImage,
        this.tomatoRating,
        this.userRating});

  Opening.fromJson(Map<String, dynamic> json) {
    emsId = json['emsId'];
    emsVersionId = json['emsVersionId'];
    name = json['name'];
    posterImage = json['posterImage'] != null
        ? new PosterImage.fromJson(json['posterImage'])
        : null;
    tomatoRating = json['tomatoRating'] != null
        ? new TomatoRating.fromJson(json['tomatoRating'])
        : null;
    userRating = json['userRating'] != null
        ? new UserRating.fromJson(json['userRating'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emsId'] = this.emsId;
    data['emsVersionId'] = this.emsVersionId;
    data['name'] = this.name;
    if (this.posterImage != null) {
      data['posterImage'] = this.posterImage!.toJson();
    }
    if (this.tomatoRating != null) {
      data['tomatoRating'] = this.tomatoRating!.toJson();
    }
    if (this.userRating != null) {
      data['userRating'] = this.userRating!.toJson();
    }
    return data;
  }
}

class UserRatingPopular {
  int? dtlLikedScore;
  int? dtlWtsScore;
  int? dtlWtsCount;
  int? dtlScoreCount;
  IconImage? iconImage;

  UserRatingPopular(
      {this.dtlLikedScore,
        this.dtlWtsScore,
        this.dtlWtsCount,
        this.dtlScoreCount,
        this.iconImage});

  UserRatingPopular.fromJson(Map<String, dynamic> json) {
    dtlLikedScore = json['dtlLikedScore'];
    dtlWtsScore = json['dtlWtsScore'];
    dtlWtsCount = json['dtlWtsCount'];
    dtlScoreCount = json['dtlScoreCount'];
    iconImage = json['iconImage'] != null
        ? new IconImage.fromJson(json['iconImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dtlLikedScore'] = this.dtlLikedScore;
    data['dtlWtsScore'] = this.dtlWtsScore;
    data['dtlWtsCount'] = this.dtlWtsCount;
    data['dtlScoreCount'] = this.dtlScoreCount;
    if (this.iconImage != null) {
      data['iconImage'] = this.iconImage!.toJson();
    }
    return data;
  }
}
