class CoinDto {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? numMarketPairs;
  String? dateAdded;
  List<String>? tags;
  double? marketCapByTotalSupply;
  double? maxSupply;
  double? circulatingSupply;
  double? totalSupply;
  Platform? platform;
  int? cmcRank;
  double? selfReportedCirculatingSupply;
  double? selfReportedMarketCap;
  double? tvlRatio;
  String? lastUpdated;
  Quote? quote;

  CoinDto(
      {this.id,
      this.name,
      this.symbol,
      this.slug,
      this.numMarketPairs,
      this.dateAdded,
      this.tags,
      this.marketCapByTotalSupply,
      this.maxSupply,
      this.circulatingSupply,
      this.totalSupply,
      this.platform,
      this.cmcRank,
      this.selfReportedCirculatingSupply,
      this.selfReportedMarketCap,
      this.tvlRatio,
      this.lastUpdated,
      this.quote});

  CoinDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    numMarketPairs = json['num_market_pairs'] is double
        ? (json['num_market_pairs'] as double).toInt()
        : json['num_market_pairs'];
    dateAdded = json['date_added'];
    tags = json['tags'].cast<String>();
    marketCapByTotalSupply = json["market_cap_by_total_supply"] is int
        ? (json["market_cap_by_total_supply"] as int).toDouble()
        : json["market_cap_by_total_supply"];
    maxSupply = json['max_supply'] is int
        ? (json['max_supply'] as int).toDouble()
        : json['max_supply'];
    circulatingSupply = json['circulating_supply'] is int
        ? (json['circulating_supply'] as int).toDouble()
        : json['circulating_supply'];
    totalSupply = json['total_supply'] is int
        ? (json['total_supply'] as int).toDouble()
        : json['total_supply'];
    platform =
        json['platform'] != null ? Platform.fromJson(json['platform']) : null;
    cmcRank = json['cmc_rank'] is double
        ? (json['cmc_rank'] as double).toInt()
        : json['cmc_rank'];
    selfReportedCirculatingSupply =
        json['self_reported_circulating_supply'] is int
            ? (json['self_reported_circulating_supply'] as int).toDouble()
            : json['self_reported_circulating_supply'];
    selfReportedMarketCap = json['self_reported_market_cap'] is int
        ? (json['self_reported_market_cap'] as int).toDouble()
        : json['self_reported_market_cap'];
    tvlRatio = json['tvl_ratio'] is int
        ? (json['tvl_ratio'] as int).toDouble()
        : json['tvl_ratio'];
    lastUpdated = json['last_updated'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['num_market_pairs'] = numMarketPairs;
    data['date_added'] = dateAdded;
    data['tags'] = tags;
    data["market_cap_by_total_supply"];
    data['max_supply'] = maxSupply;
    data['circulating_supply'] = circulatingSupply;
    data['total_supply'] = totalSupply;
    if (platform != null) {
      data['platform'] = platform!.toJson();
    }
    data['cmc_rank'] = cmcRank;
    data['self_reported_circulating_supply'] = selfReportedCirculatingSupply;
    data['self_reported_market_cap'] = selfReportedMarketCap;
    data['tvl_ratio'] = tvlRatio;
    data['last_updated'] = lastUpdated;
    if (quote != null) {
      data['quote'] = quote!.toJson();
    }
    return data;
  }
}

class Platform {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  String? tokenAddress;

  Platform({this.id, this.name, this.symbol, this.slug, this.tokenAddress});

  Platform.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    tokenAddress = json['token_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['token_address'] = tokenAddress;
    return data;
  }
}

class Quote {
  USD? uSD;

  Quote({this.uSD});

  Quote.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uSD != null) {
      data['USD'] = uSD!.toJson();
    }
    return data;
  }
}

class USD {
  double? price;
  double? volume24h;
  double? volumeChange24h;
  double? percentChange1h;
  double? percentChange24h;
  double? percentChange7d;
  double? percentChange30d;
  double? percentChange60d;
  double? percentChange90d;
  double? marketCap;
  double? marketCapDominance;
  double? fullyDilutedMarketCap;
  double? tvl;
  String? lastUpdated;

  USD(
      {this.price,
      this.volume24h,
      this.volumeChange24h,
      this.percentChange1h,
      this.percentChange24h,
      this.percentChange7d,
      this.percentChange30d,
      this.percentChange60d,
      this.percentChange90d,
      this.marketCap,
      this.marketCapDominance,
      this.fullyDilutedMarketCap,
      this.tvl,
      this.lastUpdated});

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'] is int
        ? (json['price'] as int).toDouble()
        : json['price'];
    volume24h = json['volume_24h'] is int
        ? (json['volume_24h'] as int).toDouble()
        : json['volume_24h'];
    volumeChange24h = json['volume_change_24h'] is int
        ? (json['volume_change_24h'] as int).toDouble()
        : json['volume_change_24h'];
    percentChange1h = json['percent_change_1h'] is int
        ? (json['percent_change_1h'] as int).toDouble()
        : json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'] is int
        ? (json['percent_change_24h'] as int).toDouble()
        : json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'] is int
        ? (json['percent_change_7d'] as int).toDouble()
        : json['percent_change_7d'];
    percentChange30d = json['percent_change_30d'] is int
        ? (json['percent_change_30d'] as int).toDouble()
        : json['percent_change_30d'];
    percentChange60d = json['percent_change_60d'] is int
        ? (json['percent_change_60d'] as int).toDouble()
        : json['percent_change_60d'];
    percentChange90d = json['percent_change_90d'] is int
        ? (json['percent_change_90d'] as int).toDouble()
        : json['percent_change_90d'];
    marketCap = json['market_cap'] is int
        ? (json['market_cap'] as int).toDouble()
        : json['market_cap'];
    marketCapDominance = json['market_cap_dominance'] is int
        ? (json['market_cap_dominance'] as int).toDouble()
        : json['market_cap_dominance'];
    fullyDilutedMarketCap = json['fully_diluted_market_cap'] is int
        ? (json['fully_diluted_market_cap'] as int).toDouble()
        : json['fully_diluted_market_cap'];
    tvl = json['tvl'] is int ? (json['tvl'] as int).toDouble() : json['tvl'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['volume_change_24h'] = volumeChange24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['percent_change_30d'] = percentChange30d;
    data['percent_change_60d'] = percentChange60d;
    data['percent_change_90d'] = percentChange90d;
    data['market_cap'] = marketCap;
    data['market_cap_dominance'] = marketCapDominance;
    data['fully_diluted_market_cap'] = fullyDilutedMarketCap;
    data['tvl'] = tvl;
    data['last_updated'] = lastUpdated;
    return data;
  }
}
