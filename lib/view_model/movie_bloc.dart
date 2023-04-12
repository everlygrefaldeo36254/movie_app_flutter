import 'dart:async';
import 'package:movie_app/model/movies.dart';
import 'package:movie_app/view_model/movie_view_model.dart';

class MovieBloc {
  final MovieViewModel _moviewViewModel = MovieViewModel();

  final _moviesController = StreamController<List<Movie>>();
  Stream<List<Movie>> get moviesStream => _moviesController.stream;

  final _loadingController = StreamController<bool>();
  Stream<bool> get loadingStream => _loadingController.stream;

  void fetchPopularMovies() async {
    await _moviewViewModel.fetchMovies();
    _moviesController.add(_moviewViewModel.moviesList);
    _loadingController.add(_moviewViewModel.isLoading);
  }

  void dispose() {
    _moviesController.close();
    _loadingController.close();
  }
}
