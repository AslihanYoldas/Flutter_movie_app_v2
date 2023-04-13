class UpcomingMovies {
  Data? data;

  UpcomingMovies({this.data});

  UpcomingMovies.fromJson(Map<String, dynamic> json) {
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
  List<Upcoming>? upcoming;

  Data({this.upcoming});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['upcoming'] != null) {
      upcoming = <Upcoming>[];
      json['upcoming'].forEach((v) {
        upcoming!.add(new Upcoming.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.upcoming != null) {
      data['upcoming'] = this.upcoming!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Upcoming {
  String? emsId;
  String? emsVersionId;
  String? name;
  String? releaseDate;
  PosterImage? posterImage;
  TomatoRating? tomatoRating;
  UserRating? userRating;

  Upcoming(
      {this.emsId,
        this.emsVersionId,
        this.name,
        this.releaseDate,
        this.posterImage,
        this.tomatoRating,
        this.userRating});

  Upcoming.fromJson(Map<String, dynamic> json) {
    emsId = json['emsId'];
    emsVersionId = json['emsVersionId'];
    name = json['name'];
    releaseDate = json['releaseDate'];
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
    data['releaseDate'] = this.releaseDate;
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
  Null? type;
  Null? width;
  Null? height;

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
  int? ratingCount;
  IconImage? iconImage;

  TomatoRating({this.tomatometer, this.ratingCount, this.iconImage});

  TomatoRating.fromJson(Map<String, dynamic> json) {
    tomatometer = json['tomatometer'];
    ratingCount = json['ratingCount'];
    iconImage = json['iconImage'] != null
        ? new IconImage.fromJson(json['iconImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tomatometer'] = this.tomatometer;
    data['ratingCount'] = this.ratingCount;
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
  Null? ratingCount;
  int? dtlWtsCount;
  Null? dtlWtsScore;
  int? dtlScoreCount;
  IconImage? iconImage;

  UserRating(
      {this.dtlLikedScore,
        this.ratingCount,
        this.dtlWtsCount,
        this.dtlWtsScore,
        this.dtlScoreCount,
        this.iconImage});

  UserRating.fromJson(Map<String, dynamic> json) {
    dtlLikedScore = json['dtlLikedScore'];
    ratingCount = json['ratingCount'];
    dtlWtsCount = json['dtlWtsCount'];
    dtlWtsScore = json['dtlWtsScore'];
    dtlScoreCount = json['dtlScoreCount'];
    iconImage = json['iconImage'] != null
        ? new IconImage.fromJson(json['iconImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dtlLikedScore'] = this.dtlLikedScore;
    data['ratingCount'] = this.ratingCount;
    data['dtlWtsCount'] = this.dtlWtsCount;
    data['dtlWtsScore'] = this.dtlWtsScore;
    data['dtlScoreCount'] = this.dtlScoreCount;
    if (this.iconImage != null) {
      data['iconImage'] = this.iconImage!.toJson();
    }
    return data;
  }
}
