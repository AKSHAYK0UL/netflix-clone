import 'package:netflix/model/previousepisodelink.dart';
import 'package:netflix/model/selflink.dart';

class ShowLinks {
  SelfLink? self;
  PreviousEpisodeLink? previousepisode;

  ShowLinks({this.self, this.previousepisode});

  factory ShowLinks.fromJson(Map<String, dynamic> json) {
    return ShowLinks(
      self: json['self'] != null ? SelfLink.fromJson(json['self']) : null,
      previousepisode: json['previousepisode'] != null
          ? PreviousEpisodeLink.fromJson(json['previousepisode'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'self': self?.toJson(),
      'previousepisode': previousepisode?.toJson(),
    };
  }
}
