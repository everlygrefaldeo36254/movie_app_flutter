import 'package:movie_app/model/images.dart';

class Movie {
  final int id;
  final String name;
  final Image? image;
  final String summary;
  Movie({
    required this.id,
    required this.name,
    this.image,
    required this.summary,
  }) : assert(id >= 0);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      name: json['name'],
      image: json.containsKey('image') ? Image.fromJson(json['image']) : null,
      summary: json['summary'],
    );
  }
}
