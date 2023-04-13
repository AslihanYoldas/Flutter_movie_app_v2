class MovieDetail {
  Data? data;

  MovieDetail({this.data});

  MovieDetail.fromJson(Map<String, dynamic> json) {
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
  Movie? movie;

  Data({this.movie});

  Data.fromJson(Map<String, dynamic> json) {
    movie = json['movie'] != null ? new Movie.fromJson(json['movie']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movie != null) {
      data['movie'] = this.movie!.toJson();
    }
    return data;
  }
}

class Movie {
  String? emsId;
  String? fandangoId;
  String? rtMovieId;
  String? name;
  int? durationMinutes;
  String? synopsis;
  String? directedBy;
  String? releaseDate;
  String? showReleaseDate;
  String? dvdReleaseDate;
  String? availabilityWindow;
  String? ovdReleaseDate;
  String? totalGross;
  Trailer? trailer;
  PosterImage? posterImage;
  BackgroundImage? backgroundImage;
  UserRating? userRating;
  TomatoRating? tomatoRating;
  List<Genres>? genres;
  List<Images>? images;
  List<Cast>? cast;
  List<Crew>? crew;
  MotionPictureRating? motionPictureRating;
  List<Ovds>? ovds;
  List<CriticReviews>? criticReviews;
  ShowtimeGroupings? showtimeGroupings;

  Movie(
      {this.emsId,
        this.fandangoId,
        this.rtMovieId,
        this.name,
        this.durationMinutes,
        this.synopsis,
        this.directedBy,
        this.releaseDate,
        this.showReleaseDate,
        this.dvdReleaseDate,
        this.availabilityWindow,
        this.ovdReleaseDate,
        this.totalGross,
        this.trailer,
        this.posterImage,
        this.backgroundImage,
        this.userRating,
        this.tomatoRating,
        this.genres,
        this.images,
        this.cast,
        this.crew,
        this.motionPictureRating,
        this.ovds,
        this.criticReviews,
        this.showtimeGroupings});

  Movie.fromJson(Map<String, dynamic> json) {
    emsId = json['emsId'];
    fandangoId = json['fandangoId'];
    rtMovieId = json['rtMovieId'];
    name = json['name'];
    durationMinutes = json['durationMinutes'];
    synopsis = json['synopsis'];
    directedBy = json['directedBy'];
    releaseDate = json['releaseDate'];
    showReleaseDate = json['showReleaseDate'];
    dvdReleaseDate = json['dvdReleaseDate'];
    availabilityWindow = json['availabilityWindow'];
    ovdReleaseDate = json['ovdReleaseDate'];
    totalGross = json['totalGross'];
    trailer =
    json['trailer'] != null ? new Trailer.fromJson(json['trailer']) : null;
    posterImage = json['posterImage'] != null
        ? new PosterImage.fromJson(json['posterImage'])
        : null;
    backgroundImage = json['backgroundImage'] != null
        ? new BackgroundImage.fromJson(json['backgroundImage'])
        : null;
    userRating = json['userRating'] != null
        ? new UserRating.fromJson(json['userRating'])
        : null;
    tomatoRating = json['tomatoRating'] != null
        ? new TomatoRating.fromJson(json['tomatoRating'])
        : null;
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    if (json['cast'] != null) {
      cast = <Cast>[];
      json['cast'].forEach((v) {
        cast!.add(new Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <Crew>[];
      json['crew'].forEach((v) {
        crew!.add(new Crew.fromJson(v));
      });
    }
    motionPictureRating = json['motionPictureRating'] != null
        ? new MotionPictureRating.fromJson(json['motionPictureRating'])
        : null;
    if (json['ovds'] != null) {
      ovds = <Ovds>[];
      json['ovds'].forEach((v) {
        ovds!.add(new Ovds.fromJson(v));
      });
    }
    if (json['criticReviews'] != null) {
      criticReviews = <CriticReviews>[];
      json['criticReviews'].forEach((v) {
        criticReviews!.add(new CriticReviews.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emsId'] = this.emsId;
    data['fandangoId'] = this.fandangoId;
    data['rtMovieId'] = this.rtMovieId;
    data['name'] = this.name;
    data['durationMinutes'] = this.durationMinutes;
    data['synopsis'] = this.synopsis;
    data['directedBy'] = this.directedBy;
    data['releaseDate'] = this.releaseDate;
    data['showReleaseDate'] = this.showReleaseDate;
    data['dvdReleaseDate'] = this.dvdReleaseDate;
    data['availabilityWindow'] = this.availabilityWindow;
    data['ovdReleaseDate'] = this.ovdReleaseDate;
    data['totalGross'] = this.totalGross;
    if (this.trailer != null) {
      data['trailer'] = this.trailer!.toJson();
    }
    if (this.posterImage != null) {
      data['posterImage'] = this.posterImage!.toJson();
    }
    if (this.backgroundImage != null) {
      data['backgroundImage'] = this.backgroundImage!.toJson();
    }
    if (this.userRating != null) {
      data['userRating'] = this.userRating!.toJson();
    }
    if (this.tomatoRating != null) {
      data['tomatoRating'] = this.tomatoRating!.toJson();
    }
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.cast != null) {
      data['cast'] = this.cast!.map((v) => v.toJson()).toList();
    }
    if (this.crew != null) {
      data['crew'] = this.crew!.map((v) => v.toJson()).toList();
    }
    if (this.motionPictureRating != null) {
      data['motionPictureRating'] = this.motionPictureRating!.toJson();
    }
    if (this.ovds != null) {
      data['ovds'] = this.ovds!.map((v) => v.toJson()).toList();
    }
    if (this.criticReviews != null) {
      data['criticReviews'] =
          this.criticReviews!.map((v) => v.toJson()).toList();
    }

    if (this.showtimeGroupings != null) {
      data['showtimeGroupings'] = this.showtimeGroupings!.toJson();
    }
    return data;
  }
}

class Trailer {
  String? url;
  String? freewheelId;
  String? duration;

  Trailer({this.url, this.freewheelId, this.duration});

  Trailer.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    freewheelId = json['freewheelId'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['freewheelId'] = this.freewheelId;
    data['duration'] = this.duration;
    return data;
  }
}

class PosterImage {
  String? url;
  int? width;
  int? height;

  PosterImage({this.url,  this.width, this.height});

  PosterImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];

    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class BackgroundImage {
  String? url;
  String? type;
  int? width;
  int? height;

  BackgroundImage({this.url, this.type, this.width, this.height});

  BackgroundImage.fromJson(Map<String, dynamic> json) {
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

class UserRating {
  int? dtlLikedScore;
  int? dtlWtsScore;
  int? ratingCount;
  IconImage? iconImage;

  UserRating(
      {this.dtlLikedScore, this.dtlWtsScore, this.ratingCount, this.iconImage});

  UserRating.fromJson(Map<String, dynamic> json) {
    dtlLikedScore = json['dtlLikedScore'];
    dtlWtsScore = json['dtlWtsScore'];
    ratingCount = json['ratingCount'];
    iconImage = json['iconImage'] != null
        ? new IconImage.fromJson(json['iconImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dtlLikedScore'] = this.dtlLikedScore;
    data['dtlWtsScore'] = this.dtlWtsScore;
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
class Images {
  String? url;
  int? width;
  int? height;


  Images(this.url, this.width, this.height);

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}

class TomatoRating {
  int? tomatometer;
  int? ratingCount;
  String? consensus;
  IconImage? iconImage;
  IconImage? largeIconImage;

  TomatoRating(
      {this.tomatometer,
        this.ratingCount,
        this.consensus,
        this.iconImage,
        this.largeIconImage});

  TomatoRating.fromJson(Map<String, dynamic> json) {
    tomatometer = json['tomatometer'];
    ratingCount = json['ratingCount'];
    consensus = json['consensus'];
    iconImage = json['iconImage'] != null
        ? new IconImage.fromJson(json['iconImage'])
        : null;
    largeIconImage = json['largeIconImage'] != null
        ? new IconImage.fromJson(json['largeIconImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tomatometer'] = this.tomatometer;
    data['ratingCount'] = this.ratingCount;
    data['consensus'] = this.consensus;
    if (this.iconImage != null) {
      data['iconImage'] = this.iconImage!.toJson();
    }
    if (this.largeIconImage != null) {
      data['largeIconImage'] = this.largeIconImage!.toJson();
    }
    return data;
  }
}

class Genres {
  String? name;

  Genres({this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Cast {
  int? id;
  String? role;
  String? name;
  String? characterName;
  BackgroundImage? headShotImage;

  Cast({this.id, this.role, this.name, this.characterName, this.headShotImage});

  Cast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'];
    characterName = json['characterName'];
    headShotImage = json['headShotImage'] != null
        ? new BackgroundImage.fromJson(json['headShotImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['name'] = this.name;
    data['characterName'] = this.characterName;
    if (this.headShotImage != null) {
      data['headShotImage'] = this.headShotImage!.toJson();
    }
    return data;
  }
}

class Crew {
  int? id;
  String? role;
  String? name;
  BackgroundImage? headShotImage;

  Crew({this.id, this.role, this.name, this.headShotImage});

  Crew.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
    name = json['name'];
    headShotImage = json['headShotImage'] != null
        ? new BackgroundImage.fromJson(json['headShotImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    data['name'] = this.name;
    if (this.headShotImage != null) {
      data['headShotImage'] = this.headShotImage!.toJson();
    }
    return data;
  }
}

class MotionPictureRating {
  String? code;
  String? description;

  MotionPictureRating({ this.code, this.description});

  MotionPictureRating.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }
}

class Ovds {
  String? videoId;
  String? url;
  String? lastSeen;
  Host? host;

  Ovds({this.videoId, this.url, this.lastSeen, this.host});

  Ovds.fromJson(Map<String, dynamic> json) {
    videoId = json['videoId'];
    url = json['url'];
    lastSeen = json['lastSeen'];
    host = json['host'] != null ? new Host.fromJson(json['host']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videoId'] = this.videoId;
    data['url'] = this.url;
    data['lastSeen'] = this.lastSeen;
    if (this.host != null) {
      data['host'] = this.host!.toJson();
    }
    return data;
  }
}

class Host {
  String? hostId;
  String? name;
  String? alphaLight;
  String? alphaDark;
  String? solidLight;
  String? solidDark;

  Host(
      {this.hostId,
        this.name,
        this.alphaLight,
        this.alphaDark,
        this.solidLight,
        this.solidDark});

  Host.fromJson(Map<String, dynamic> json) {
    hostId = json['hostId'];
    name = json['name'];
    alphaLight = json['alphaLight'];
    alphaDark = json['alphaDark'];
    solidLight = json['solidLight'];
    solidDark = json['solidDark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hostId'] = this.hostId;
    data['name'] = this.name;
    data['alphaLight'] = this.alphaLight;
    data['alphaDark'] = this.alphaDark;
    data['solidLight'] = this.solidLight;
    data['solidDark'] = this.solidDark;
    return data;
  }
}

class CriticReviews {
  IconImage? iconImage;
  String? criticName;
  String? publicationName;
  String? body;
  String? url;

  CriticReviews(
      {this.iconImage,
        this.criticName,
        this.publicationName,
        this.body,
        this.url});

  CriticReviews.fromJson(Map<String, dynamic> json) {
    iconImage = json['iconImage'] != null
        ? new IconImage.fromJson(json['iconImage'])
        : null;
    criticName = json['criticName'];
    publicationName = json['publicationName'];
    body = json['body'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iconImage != null) {
      data['iconImage'] = this.iconImage!.toJson();
    }
    data['criticName'] = this.criticName;
    data['publicationName'] = this.publicationName;
    data['body'] = this.body;
    data['url'] = this.url;
    return data;
  }
}




class ShowtimeGroupings {
  String? fandangoId;
  String? movieId;
  String? displayDate;
  String? mppBaseUrl;


  ShowtimeGroupings(
      {this.fandangoId,
        this.movieId,
        this.displayDate,
        this.mppBaseUrl,
      });

  ShowtimeGroupings.fromJson(Map<String, dynamic> json) {
    fandangoId = json['fandangoId'];
    movieId = json['movieId'];

    }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fandangoId'] = this.fandangoId;
    data['movieId'] = this.movieId;

    return data;
  }
}
