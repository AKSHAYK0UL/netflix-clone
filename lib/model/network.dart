import 'package:netflix/model/country.dart';

class Network {
  int? id;
  String? name;
  Country? country;
  String? officialSite;

  Network({this.id, this.name, this.country, this.officialSite});

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json['id'],
      name: json['name'],
      country:
          json['country'] != null ? Country.fromJson(json['country']) : null,
      officialSite: json['officialSite'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country': country?.toJson(),
      'officialSite': officialSite,
    };
  }
}
