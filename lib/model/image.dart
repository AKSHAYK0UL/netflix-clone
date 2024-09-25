class Image {
  String? medium;
  String? original;

  Image({this.medium, this.original});

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      medium: json['medium'],
      original: json['original'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'medium': medium,
      'original': original,
    };
  }
}
