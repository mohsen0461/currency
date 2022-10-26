import 'package:coinmarketcap/app/data/models/coins/news.dart';

// class NewsResponse {
//   Meta? meta;
//   List<NewsDto>? data;

//   NewsResponse({this.meta, this.data});

//   NewsResponse.fromJson(Map<String, dynamic> json) {
//     meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
//     if (json['data'] != null) {
//       data = <NewsDto>[];
//       json['data'].forEach((v) {
//         data!.add(NewsDto.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (meta != null) {
//       data['meta'] = meta!.toJson();
//     }
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Meta {
//   int? found;
//   int? returned;
//   int? limit;
//   int? page;

//   Meta({this.found, this.returned, this.limit, this.page});

//   Meta.fromJson(Map<String, dynamic> json) {
//     found = json['found'];
//     returned = json['returned'];
//     limit = json['limit'];
//     page = json['page'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['found'] = found;
//     data['returned'] = returned;
//     data['limit'] = limit;
//     data['page'] = page;
//     return data;
//   }
// }
class NewsResponse {
  String? status;
  int? totalResults;
  List<NewsDto>? results;
  int? nextPage;

  NewsResponse({this.status, this.totalResults, this.results, this.nextPage});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['results'] != null) {
      results = <NewsDto>[];
      json['results'].forEach((v) {
        results!.add(NewsDto.fromJson(v));
      });
    }
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['nextPage'] = nextPage;
    return data;
  }
}
