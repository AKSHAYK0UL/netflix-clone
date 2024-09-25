class WebChannel {
  int? id;
  String? name;
  String? officialSite;

  WebChannel({this.id, this.name, this.officialSite});

  factory WebChannel.fromJson(Map<String, dynamic> json) {
    return WebChannel(
      id: json['id'],
      name: json['name'],
      officialSite: json['officialSite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'officialSite': officialSite,
    };
  }
}
