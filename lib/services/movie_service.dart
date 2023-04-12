import 'dart:convert';

import '../model/movies.dart';
import 'package:http/http.dart' as http;

class MovieService {
  final String _baseUrL = 'https://api.tvmaze.com/shows';

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(_baseUrL));

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      final List<Movie> movies = [];

      for (var data in json) {
        movies.add(Movie.fromJson(data as Map<String, dynamic>));
      }

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
