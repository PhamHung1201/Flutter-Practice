import 'package:flutter_practice/models/MovieResponse.dart';
import 'package:flutter_practice/resources/MovieProvider.dart';
import 'package:rxdart/rxdart.dart';

class PopularMovieBloc {
  final artistProvider = MovieProvider();

  Observable<PopularMoviesResponse> fetchPopularMovie() {
    return Observable.fromFuture(artistProvider.fetchPopularMovies());
  }
}
