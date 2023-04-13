class Review {
  Data? data;

  Review({this.data});

  Review.fromJson(Map<String, dynamic> json) {
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
  AudienceReviews? audienceReviews;

  Data({this.audienceReviews});

  Data.fromJson(Map<String, dynamic> json) {
    audienceReviews = json['audienceReviews'] != null
        ? new AudienceReviews.fromJson(json['audienceReviews'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.audienceReviews != null) {
      data['audienceReviews'] = this.audienceReviews!.toJson();
    }
    return data;
  }
}

class AudienceReviews {
  int? totalCount;
  int? nextOffset;
  bool? hasNextPage;
  bool? hasPreviousPage;
  List<Items>? items;

  AudienceReviews(
      {this.totalCount,
        this.nextOffset,
        this.hasNextPage,
        this.hasPreviousPage,
        this.items});

  AudienceReviews.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    nextOffset = json['nextOffset'];
    hasNextPage = json['hasNextPage'];
    hasPreviousPage = json['hasPreviousPage'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['nextOffset'] = this.nextOffset;
    data['hasNextPage'] = this.hasNextPage;
    data['hasPreviousPage'] = this.hasPreviousPage;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  Null? userFullName;
  Null? userImage;
  Null? iconImage;
  num? rating;
  Null? isInterested;
  String? comment;

  Items(
      {this.userFullName,
        this.userImage,
        this.iconImage,
        this.rating,
        this.isInterested,
        this.comment});

  Items.fromJson(Map<String, dynamic> json) {
    userFullName = json['userFullName'];
    userImage = json['userImage'];
    iconImage = json['iconImage'];
    rating = json['rating'];
    isInterested = json['isInterested'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userFullName'] = this.userFullName;
    data['userImage'] = this.userImage;
    data['iconImage'] = this.iconImage;
    data['rating'] = this.rating;
    data['isInterested'] = this.isInterested;
    data['comment'] = this.comment;
    return data;
  }
}
