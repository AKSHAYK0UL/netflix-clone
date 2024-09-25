class PreviousEpisodeLink {
  String? href;
  String? name;

  PreviousEpisodeLink({this.href, this.name});

  factory PreviousEpisodeLink.fromJson(Map<String, dynamic> json) {
    return PreviousEpisodeLink(
      href: json['href'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
      'name': name,
    };
  }
}
