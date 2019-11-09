import 'package:flutter_practice/resources/MovieProvider.dart';

class PopularMoviesResponse {
  final List<Movie> movies;

  PopularMoviesResponse({this.movies});

  factory PopularMoviesResponse.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Movie> result = list.map((i) => Movie.fromJson(i)).toList();
    return PopularMoviesResponse(movies: result);
  }
}
const String BASE = "http://image.tmdb.org/t/p/";
const String W342 = "w342";

class Movie {
  final String title;
  final String posterUrl;

  Movie({this.title, this.posterUrl});

  factory Movie.fromJson(Map<String, dynamic> json) {
    posterUrl: var rawPoster = json["poster_path"];
    return Movie(title: json["title"], posterUrl: '$BASE$W342/$rawPoster');
  }
}

