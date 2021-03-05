import 'dart:convert';

import 'package:great_movie/models/movie_list_model.dart';
import 'package:http/http.dart' as http;

Future<MovieListModel> getMovies() async {
  var response = await http.get(Uri.http("165.22.75.82", "v1/movies"));
  var decodedData = jsonDecode(response.body);
  MovieListModel movies;
  movies = MovieListModel.fromJson(decodedData);
  return movies;
}
