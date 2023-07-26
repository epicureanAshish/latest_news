class NewsResponseModel {
  String? status;
  int? totalHits;
  int? page;
  int? totalPages;
  int? pageSize;
  List<Articles>? articles;
  UserInput? userInput;

  NewsResponseModel(
      {this.status,
        this.totalHits,
        this.page,
        this.totalPages,
        this.pageSize,
        this.articles,
        this.userInput});

  NewsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalHits = json['total_hits'];
    page = json['page'];
    totalPages = json['total_pages'];
    pageSize = json['page_size'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
    userInput = json['user_input'] != null
        ? new UserInput.fromJson(json['user_input'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total_hits'] = this.totalHits;
    data['page'] = this.page;
    data['total_pages'] = this.totalPages;
    data['page_size'] = this.pageSize;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    if (this.userInput != null) {
      data['user_input'] = this.userInput!.toJson();
    }
    return data;
  }
}

class Articles {
  String? title;
  String? author;
  String? publishedDate;
  String? publishedDatePrecision;
  String? link;
  String? cleanUrl;
  String? excerpt;
  String? summary;
  String? rights;
  int? rank;
  String? topic;
  String? country;
  String? language;
  String? authors;
  String? media;
  bool? isOpinion;
  String? twitterAccount;
  double? dScore;
  String? sId;

  Articles(
      {this.title,
        this.author,
        this.publishedDate,
        this.publishedDatePrecision,
        this.link,
        this.cleanUrl,
        this.excerpt,
        this.summary,
        this.rights,
        this.rank,
        this.topic,
        this.country,
        this.language,
        this.authors,
        this.media,
        this.isOpinion,
        this.twitterAccount,
        this.dScore,
        this.sId});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    author = json['author'];
    publishedDate = json['published_date'];
    publishedDatePrecision = json['published_date_precision'];
    link = json['link'];
    cleanUrl = json['clean_url'];
    excerpt = json['excerpt'];
    summary = json['summary'];
    rights = json['rights'];
    rank = json['rank'];
    topic = json['topic'];
    country = json['country'];
    language = json['language'];
    authors = json['authors'];
    media = json['media'];
    isOpinion = json['is_opinion'];
    twitterAccount = json['twitter_account'];
    dScore = json['_score'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['author'] = this.author;
    data['published_date'] = this.publishedDate;
    data['published_date_precision'] = this.publishedDatePrecision;
    data['link'] = this.link;
    data['clean_url'] = this.cleanUrl;
    data['excerpt'] = this.excerpt;
    data['summary'] = this.summary;
    data['rights'] = this.rights;
    data['rank'] = this.rank;
    data['topic'] = this.topic;
    data['country'] = this.country;
    data['language'] = this.language;
    data['authors'] = this.authors;
    data['media'] = this.media;
    data['is_opinion'] = this.isOpinion;
    data['twitter_account'] = this.twitterAccount;
    data['_score'] = this.dScore;
    data['_id'] = this.sId;
    return data;
  }
}

class UserInput {
  String? q;
  String? from;
  String? rankedOnly;
  int? toRank;
  String? sortBy;
  int? page;
  int? size;

  UserInput(
      {this.q,
        this.from,
        this.rankedOnly,
        this.toRank,
        this.sortBy,
        this.page,
        this.size,
        });

  UserInput.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    from = json['from'];
    rankedOnly = json['ranked_only'];
    toRank = json['to_rank'];
    sortBy = json['sort_by'];
    page = json['page'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['q'] = this.q;
    data['from'] = this.from;
    data['ranked_only'] = this.rankedOnly;
    data['to_rank'] = this.toRank;
    data['sort_by'] = this.sortBy;
    data['page'] = this.page;
    data['size'] = this.size;
    return data;
  }
}
