class Schedule {
  String? time;
  List<String>? days;

  Schedule({this.time, this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'],
      days: List<String>.from(json['days']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'days': days,
    };
  }
}

class Rating {
  double? average;

  Rating({this.average});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: json['average']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'average': average,
    };
  }
}
