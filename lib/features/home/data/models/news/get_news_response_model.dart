class GetNewsResponseModel {
  String? status;
  String? description;
  Data? data;

  GetNewsResponseModel({this.status, this.description, this.data});

  GetNewsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['description'] = description;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? tableSlug;
  NewsData? newsData;

  Data({
    this.tableSlug,
    this.newsData,
  });

  Data.fromJson(Map<String, dynamic> json) {
    tableSlug = json['table_slug'];
    newsData = json['data'] != null ? NewsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['table_slug'] = tableSlug;
    if (newsData != null) {
      data['data'] = newsData!.toJson();
    }
    return data;
  }
}

class NewsData {
  int? count;
  List<NewsResponse>? response;

  NewsData({this.count, this.response});

  NewsData.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['response'] != null) {
      response = <NewsResponse>[];
      json['response'].forEach((v) {
        response!.add(NewsResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewsResponse {
  String? authorId;
  String? comment;
  String? date;
  String? guid;
  String? title;
  String? photo;
  String? tag;

  NewsResponse({
    this.authorId,
    this.comment,
    this.date,
    this.guid,
    this.tag,
    this.title,
    this.photo,
  });

  NewsResponse.fromJson(Map<String, dynamic> json) {
    authorId = json['author_id'];
    comment = json['comment'];
    date = json['date'];
    guid = json['guid'];
    tag = json['tag'];
    title = json['title'];
    guid = json['guid'];
    photo = json['news_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author_id'] = authorId;
    data['comment'] = comment;
    data['date'] = date;
    data['guid'] = guid;
    data['title'] = title;
    data['tag'] = tag;
    data['news_photo'] = photo;
    return data;
  }
}
