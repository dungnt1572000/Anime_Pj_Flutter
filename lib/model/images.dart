class Images {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Pictures> pictures;

  Images(
      {required this.requestHash,
      required this.requestCached,
      required this.requestCacheExpiry,
      required this.pictures});

  factory Images.fromJson(Map<String, dynamic> json) {
    var _getimg = json['pictures'] as List;
    List<Pictures> _pictures =
        _getimg.map((e) => Pictures.fromJson(e)).toList();
    return Images(
        requestHash: json['request_hash'],
        requestCached: json['request_cached'],
        requestCacheExpiry: json['request_cache_expiry'],
        pictures: _pictures);
  }
}

class Pictures {
  String large;
  String small;

  Pictures({required this.large, required this.small});

  factory Pictures.fromJson(Map<String, dynamic> json) {
    return Pictures(large: json['large'], small: json['small']);
  }
}
