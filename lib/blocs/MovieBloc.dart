import 'package:flutter_practice/factory/movie_item_view_factory.dart';
import 'package:flutter_practice/models/MovieResponse.dart';
import 'package:flutter_practice/models/view/MovieItemView.dart';
import 'package:flutter_practice/resources/MovieProvider.dart';
import 'package:rxdart/rxdart.dart';

class PopularMovieBloc {
  final artistProvider = MovieProvider();
  final factory = MovieItemViewFactory();

  Observable<List<MovieItemView>> fetchPopularMovie() {
    return Observable.fromFuture(artistProvider.fetchPopularMovies())
    .map((response) => factory.create(response));
  }
}
