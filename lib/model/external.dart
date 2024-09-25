class Externals {
  int? tvrage;
  int? thetvdb;
  String? imdb;

  Externals({this.tvrage, this.thetvdb, this.imdb});

  factory Externals.fromJson(Map<String, dynamic> json) {
    return Externals(
      tvrage: json['tvrage'],
      thetvdb: json['thetvdb'],
      imdb: json['imdb'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tvrage': tvrage,
      'thetvdb': thetvdb,
      'imdb': imdb,
    };
  }
}
