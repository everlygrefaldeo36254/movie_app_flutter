import 'package:flutter/foundation.dart';
import 'package:movie_app/model/movies.dart';
import 'package:movie_app/services/movie_service.dart';

class MovieViewModel extends ChangeNotifier {
  final MovieService _service = MovieService();
  List<Movie> _movies = [];
  List<Movie> get moviesList => _movies;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      _movies = await _service.getPopularMovies();
    } catch (e) {
      //  print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
