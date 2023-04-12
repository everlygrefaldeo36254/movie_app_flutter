import 'package:flutter/material.dart';
import 'package:movie_app/view/screens/movie_list.dart';
import 'package:movie_app/view/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: appThemeData,
      home: const MovieList(),
    );
  }
}
