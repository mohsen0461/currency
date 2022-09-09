import 'package:coinmarketcap/app/data/models/coins/coin.dart';

class CoinResponse {
  Status? status;
  List<CoinDto>? data;

  CoinResponse({this.status, this.data});

  CoinResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    if (json['data'] != null) {
      data = <CoinDto>[];

      json['data'].forEach((v) {
        // checkDouble(v);
        data!.add(CoinDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  String? timestamp;
  int? errorCode;
  String? errorMessage;
  // Null? errorMessage;
  int? elapsed;
  int? creditCount;
  Null? notice;
  int? totalCount;

  Status(
      {this.timestamp,
      this.errorCode,
      this.errorMessage,
      this.elapsed,
      this.creditCount,
      this.notice,
      this.totalCount});

  Status.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    errorCode = json['error_code'];
    errorMessage = json['error_message'];
    elapsed = json['elapsed'];
    creditCount = json['credit_count'];
    notice = json['notice'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['error_code'] = errorCode;
    data['error_message'] = errorMessage;
    data['elapsed'] = elapsed;
    data['credit_count'] = creditCount;
    data['notice'] = notice;
    data['total_count'] = totalCount;
    return data;
  }
}
