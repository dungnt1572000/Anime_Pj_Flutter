class Animes_characters {
  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  List<Characters> characters;

  Animes_characters(
      {required this.requestHash,
      required this.requestCached,
      required this.requestCacheExpiry,
      required this.characters});

  factory Animes_characters.fromJson(Map<String, dynamic> json) {
    var tagObj = json['characters'] as List;
    List<Characters> _characters =
        tagObj.map((tagJson) => Characters.fromJson(tagJson)).toList();
    return Animes_characters(
        requestHash: json['request_hash'],
        requestCached: json['request_cached'],
        requestCacheExpiry: json['request_cache_expiry'],
        characters: _characters);
  }
}

class Characters {
  int malId;
  String url;
  String imageUrl;
  String name;
  String role;

  Characters(
      {required this.malId,
      required this.url,
      required this.imageUrl,
      required this.name,
      required this.role});

  factory Characters.fromJson(Map<String, dynamic> json) {
    return Characters(
      malId: json['mal_id'],
      url: json['url'],
      imageUrl: json['image_url'],
      name: json['name'],
      role: json['role'],
    );
  }
}
