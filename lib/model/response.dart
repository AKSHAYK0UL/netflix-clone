import 'package:netflix/model/show.dart';

class ShowResponse {
  double? score;
  Show? show;

  ShowResponse({this.score, this.show});

  factory ShowResponse.fromJson(Map<String, dynamic> json) {
    return ShowResponse(
      score: json['score']?.toDouble(),
      show: json['show'] != null ? Show.fromJson(json['show']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'score': score,
      'show': show?.toJson(),
    };
  }
}
