class News {
  Data? data;

  News({this.data});

  News.fromJson(Map<String, dynamic> json) {
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
  List<NewsStories>? newsStories;

  Data({this.newsStories});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['newsStories'] != null) {
      newsStories = <NewsStories>[];
      json['newsStories'].forEach((v) {
        newsStories!.add(new NewsStories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newsStories != null) {
      data['newsStories'] = this.newsStories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsStories {
  String? id;
  String? title;
  MainImage? mainImage;
  String? status;
  String? link;

  NewsStories({this.id, this.title, this.mainImage, this.status, this.link});

  NewsStories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    mainImage = json['mainImage'] != null
        ? new MainImage.fromJson(json['mainImage'])
        : null;
    status = json['status'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.mainImage != null) {
      data['mainImage'] = this.mainImage!.toJson();
    }
    data['status'] = this.status;
    data['link'] = this.link;
    return data;
  }
}

class MainImage {
  String? url;

  MainImage({this.url});

  MainImage.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
