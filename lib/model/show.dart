import 'package:netflix/model/external.dart';
import 'package:netflix/model/image.dart';
import 'package:netflix/model/network.dart';
import 'package:netflix/model/schedule.dart';
import 'package:netflix/model/showlink.dart';
import 'package:netflix/model/webchannel.dart';

class Show {
  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  List<String>? genres;
  String? status;
  int? runtime;
  int? averageRuntime;
  String? premiered;
  String? ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  int? weight;
  Network? network;
  WebChannel? webChannel;
  Externals? externals;
  Image? image;
  String? summary;
  int? updated;
  ShowLinks? links;

  Show({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'],
      url: json['url'],
      name: json['name'],
      type: json['type'],
      language: json['language'],
      genres: List<String>.from(json['genres']),
      status: json['status'],
      runtime: json['runtime'],
      averageRuntime: json['averageRuntime'],
      premiered: json['premiered'],
      ended: json['ended'],
      officialSite: json['officialSite'],
      schedule:
          json['schedule'] != null ? Schedule.fromJson(json['schedule']) : null,
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
      weight: json['weight'],
      network:
          json['network'] != null ? Network.fromJson(json['network']) : null,
      webChannel: json['webChannel'] != null
          ? WebChannel.fromJson(json['webChannel'])
          : null,
      externals: json['externals'] != null
          ? Externals.fromJson(json['externals'])
          : null,
      image: json['image'] != null ? Image.fromJson(json['image']) : null,
      summary: json['summary'],
      updated: json['updated'],
      links: json['_links'] != null ? ShowLinks.fromJson(json['_links']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'name': name,
      'type': type,
      'language': language,
      'genres': genres,
      'status': status,
      'runtime': runtime,
      'averageRuntime': averageRuntime,
      'premiered': premiered,
      'ended': ended,
      'officialSite': officialSite,
      'schedule': schedule?.toJson(),
      'rating': rating?.toJson(),
      'weight': weight,
      'network': network?.toJson(),
      'webChannel': webChannel?.toJson(),
      'externals': externals?.toJson(),
      'image': image?.toJson(),
      'summary': summary,
      'updated': updated,
      '_links': links?.toJson(),
    };
  }
}
