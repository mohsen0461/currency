// https://www.marketaux.com/
// class NewsDto {
//   String? uuid;
//   String? title;
//   String? description;
//   String? keywords;
//   String? snippet;
//   String? url;
//   String? imageUrl;
//   String? language;
//   String? publishedAt;
//   String? source;
//   Null? relevanceScore;
//   List<Entities>? entities;
//   List<Similar>? similar;

//   NewsDto(
//       {this.uuid,
//       this.title,
//       this.description,
//       this.keywords,
//       this.snippet,
//       this.url,
//       this.imageUrl,
//       this.language,
//       this.publishedAt,
//       this.source,
//       this.relevanceScore,
//       this.entities,
//       this.similar});

//   NewsDto.fromJson(Map<String, dynamic> json) {
//     uuid = json['uuid'];
//     title = json['title'];
//     description = json['description'];
//     keywords = json['keywords'];
//     snippet = json['snippet'];
//     url = json['url'];
//     imageUrl = json['image_url'];
//     language = json['language'];
//     publishedAt = json['published_at'];
//     source = json['source'];
//     relevanceScore = json['relevance_score'];
//     if (json['entities'] != null) {
//       entities = <Entities>[];
//       json['entities'].forEach((v) {
//         entities!.add(Entities.fromJson(v));
//       });
//     }
//     if (json['similar'] != null) {
//       similar = <Similar>[];
//       json['similar'].forEach((v) {
//         similar!.add(Similar.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['uuid'] = uuid;
//     data['title'] = title;
//     data['description'] = description;
//     data['keywords'] = keywords;
//     data['snippet'] = snippet;
//     data['url'] = url;
//     data['image_url'] = imageUrl;
//     data['language'] = language;
//     data['published_at'] = publishedAt;
//     data['source'] = source;
//     data['relevance_score'] = relevanceScore;
//     if (entities != null) {
//       data['entities'] = entities!.map((v) => v.toJson()).toList();
//     }
//     if (similar != null) {
//       data['similar'] = similar!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Entities {
//   String? symbol;
//   String? name;
//   String? exchange;
//   String? exchangeLong;
//   String? country;
//   String? type;
//   String? industry;
//   double? matchScore;
//   double? sentimentScore;
//   List<Highlights>? highlights;

//   Entities(
//       {this.symbol,
//       this.name,
//       this.exchange,
//       this.exchangeLong,
//       this.country,
//       this.type,
//       this.industry,
//       this.matchScore,
//       this.sentimentScore,
//       this.highlights});

//   Entities.fromJson(Map<String, dynamic> json) {
//     symbol = json['symbol'];
//     name = json['name'];
//     exchange = json['exchange'];
//     exchangeLong = json['exchange_long'];
//     country = json['country'];
//     type = json['type'];
//     industry = json['industry'];
//     matchScore = json['match_score'] is int
//         ? (json['match_score'] as int).toDouble()
//         : json['match_score'];
//     sentimentScore = json['sentiment_score'] is int
//         ? (json['sentiment_score'] as int).toDouble()
//         : json['sentiment_score'];
//     if (json['highlights'] != null) {
//       highlights = <Highlights>[];
//       json['highlights'].forEach((v) {
//         highlights!.add(Highlights.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['symbol'] = symbol;
//     data['name'] = name;
//     data['exchange'] = exchange;
//     data['exchange_long'] = exchangeLong;
//     data['country'] = country;
//     data['type'] = type;
//     data['industry'] = industry;
//     data['match_score'] = matchScore;
//     data['sentiment_score'] = sentimentScore;
//     if (highlights != null) {
//       data['highlights'] = highlights!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Highlights {
//   String? highlight;
//   double? sentiment;
//   String? highlightedIn;

//   Highlights({this.highlight, this.sentiment, this.highlightedIn});

//   Highlights.fromJson(Map<String, dynamic> json) {
//     highlight = json['highlight'];
//     sentiment = json['sentiment'] is int
//         ? (json['sentiment'] as int).toDouble()
//         : json['sentiment'];
//     highlightedIn = json['highlighted_in'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['highlight'] = highlight;
//     data['sentiment'] = sentiment;
//     data['highlighted_in'] = highlightedIn;
//     return data;
//   }
// }

// class Similar {
//   String? uuid;
//   String? title;
//   String? description;
//   String? keywords;
//   String? snippet;
//   String? url;
//   String? imageUrl;
//   String? language;
//   String? publishedAt;
//   String? source;
//   Null? relevanceScore;
//   List<Entities>? entities;

//   Similar(
//       {this.uuid,
//       this.title,
//       this.description,
//       this.keywords,
//       this.snippet,
//       this.url,
//       this.imageUrl,
//       this.language,
//       this.publishedAt,
//       this.source,
//       this.relevanceScore,
//       this.entities});

//   Similar.fromJson(Map<String, dynamic> json) {
//     uuid = json['uuid'];
//     title = json['title'];
//     description = json['description'];
//     keywords = json['keywords'];
//     snippet = json['snippet'];
//     url = json['url'];
//     imageUrl = json['image_url'];
//     language = json['language'];
//     publishedAt = json['published_at'];
//     source = json['source'];
//     relevanceScore = json['relevance_score'];
//     if (json['entities'] != null) {
//       entities = <Entities>[];
//       json['entities'].forEach((v) {
//         entities!.add(Entities.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['uuid'] = uuid;
//     data['title'] = title;
//     data['description'] = description;
//     data['keywords'] = keywords;
//     data['snippet'] = snippet;
//     data['url'] = url;
//     data['image_url'] = imageUrl;
//     data['language'] = language;
//     data['published_at'] = publishedAt;
//     data['source'] = source;
//     data['relevance_score'] = relevanceScore;
//     if (entities != null) {
//       data['entities'] = entities!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
class NewsDto {
  String? title;
  String? link;
  List<String>? keywords;
  List<String>? creator;
  Null? videoUrl;
  String? description;
  String? content;
  String? pubDate;
  String? imageUrl;
  String? sourceId;
  List<String>? country;
  List<String>? category;
  String? language;

  NewsDto(
      {this.title,
      this.link,
      this.keywords,
      this.creator,
      this.videoUrl,
      this.description,
      this.content,
      this.pubDate,
      this.imageUrl,
      this.sourceId,
      this.country,
      this.category,
      this.language});

  NewsDto.fromJson(Map<String, dynamic> json) {
    if (json['title'] != null) {
      title = json['title'];
    }
    if (json['link'] != null) {
      link = json['link'];
    }
    if (json['keywords'] != null) {
      keywords = json['keywords'].cast<String>();
    }
    if (json['creator'] != null) {
      keywords = json['creator'].cast<String>();
    }

    if (json['video_url'] != null) {
      videoUrl = json['video_url'];
    }

    if (json['description'] != null) {
      description = json['description'];
    }

    if (json['content'] != null) {
      content = json['content'];
    }

    if (json['pubDate'] != null) {
      pubDate = json['pubDate'];
    }

    if (json['image_url'] != null) {
      imageUrl = json['image_url'];
    }

    if (json['source_id'] != null) {
      sourceId = json['source_id'];
    }

    if (json['country'] != null) {
      keywords = json['country'].cast<String>();
    }
    if (json['category'] != null) {
      keywords = json['category'].cast<String>();
    }

    if (json['language'] != null) {
      language = json['language'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['link'] = link;
    data['keywords'] = keywords;
    data['creator'] = creator;
    data['video_url'] = videoUrl;
    data['description'] = description;
    data['content'] = content;
    data['pubDate'] = pubDate;
    data['image_url'] = imageUrl;
    data['source_id'] = sourceId;
    data['country'] = country;
    data['category'] = category;
    data['language'] = language;
    return data;
  }
}
