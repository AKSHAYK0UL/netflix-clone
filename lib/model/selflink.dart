class SelfLink {
  String? href;

  SelfLink({this.href});

  factory SelfLink.fromJson(Map<String, dynamic> json) {
    return SelfLink(
      href: json['href'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
    };
  }
}
