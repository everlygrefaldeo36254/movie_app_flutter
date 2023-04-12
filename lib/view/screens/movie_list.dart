import 'package:flutter/material.dart';
import 'package:movie_app/model/movies.dart';
import 'package:movie_app/view_model/movie_bloc.dart';
import 'package:movie_app/model/images.dart' as img;

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  MovielistState createState() => MovielistState();
}

class MovielistState extends State<MovieList> {
  final MovieBloc _bloc = MovieBloc();

  @override
  void initState() {
    super.initState();
    _bloc.fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movies'),
        ),
        body: StreamBuilder<List<Movie>>(
            stream: _bloc.moviesStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final movies = snapshot.data!;
                return ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      img.Image? image = movie.image!;
                      return ListTile(
                        title: Text(movie.name),
                        subtitle: Text(removeHtmlTags(movie.summary)),
                        //leading: Image.network(image?.medium),
                        leading: Image.network(image.medium ?? ''),
                      );
                    });
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Failed to load movies'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  String removeHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
