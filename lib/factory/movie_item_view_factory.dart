import 'package:flutter_practice/models/MovieResponse.dart';
import 'package:flutter_practice/models/view/MovieItemView.dart';

const String BASE = "http://image.tmdb.org/t/p/";
const String W342 = "w342";

class MovieItemViewFactory {
  List<MovieItemView> create(PopularMoviesResponse response) {
    return response.movies.map((movie) => MovieItemView(
        movie.title, '$BASE$W342/${movie.posterUrl}', movie.overview)).toList();
  }
}
