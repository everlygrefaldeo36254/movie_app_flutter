class Image {
  final String? medium;
  final String? original;

  Image({
    this.medium,
    this.original,
  });
  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      medium: json['medium'],
      original: json['original'],
    );
  }
}
