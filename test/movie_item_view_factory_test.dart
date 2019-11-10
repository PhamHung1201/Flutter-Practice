import 'package:flutter_practice/factory/movie_item_view_factory.dart';
import 'package:flutter_practice/models/MovieResponse.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Create movie item view by response', () {
    final movie =
        Movie(title: "title", posterUrl: "poster_path", overview: "overview");
    final response = PopularMoviesResponse(movies: [movie]);

    final factory = MovieItemViewFactory();

    var actual = factory.create(response);

    expect(actual.length, 1);
    expect(actual[0].title, 'title');
    expect(actual[0].posterUrl, 'http://image.tmdb.org/t/p/w342/poster_path');
    expect(actual[0].overview, 'overview');
  });
}
