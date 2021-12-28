class Welcome8 {
  Welcome8({
    required this.requestHash,
    required this.requestCached,
    required this.requestCacheExpiry,
    required this.malId,
    required this.url,
    required this.imageUrl,
    required this.trailerUrl,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.premiered,
    required this.broadcast,
    required this.related,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.demographics,
    required this.themes,
    required this.openingThemes,
    required this.endingThemes,
    required this.externalLinks,
  });

  String requestHash;
  bool requestCached;
  int requestCacheExpiry;
  int malId;
  String url;
  String imageUrl;
  String trailerUrl;
  String title;
  String titleEnglish;
  String titleJapanese;
  List<dynamic> titleSynonyms;
  String type;
  String source;
  int episodes;
  String status;
  bool airing;
  Aired aired;
  String duration;
  String rating;
  double score;
  int scoredBy;
  int rank;
  int popularity;
  int members;
  int favorites;
  String synopsis;
  String background;
  String premiered;
  String broadcast;
  Related related;
  List<Genre> producers;
  List<Genre> licensors;
  List<Genre> studios;
  List<Genre> genres;
  List<dynamic> explicitGenres;
  List<dynamic> demographics;
  List<Genre> themes;
  List<String> openingThemes;
  List<String> endingThemes;
  List<ExternalLink> externalLinks;


}

class Aired {
  Aired({
    required this.from,
    required this.to,
    required this.prop,
    required this.string,
  });

  DateTime from;
  DateTime to;
  Prop prop;
  String string;
}

class Prop {
  Prop({
    required this.from,
    required this.to,
  });

  From from;
  From to;
}

class From {
  From({
    required this.day,
    required this.month,
    required this.year,
  });

  int day;
  int month;
  int year;
}

class ExternalLink {
  ExternalLink({
    required this.name,
    required this.url,
  });

  String name;
  String url;
}

class Genre {
  Genre({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  int malId;
  Type type;
  String name;
  String url;
}

enum Type { ANIME, MANGA }

class Related {
  Related({
    required this.adaptation,
    required this.sideStory,
    required this.summary,
  });

  List<Genre> adaptation;
  List<Genre> sideStory;
  List<Genre> summary;
}
