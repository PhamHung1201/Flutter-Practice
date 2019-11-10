class PopularMoviesResponse {
  final List<Movie> movies;

  PopularMoviesResponse({this.movies});

  factory PopularMoviesResponse.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;
    List<Movie> result = list.map((i) => Movie.fromJson(i)).toList();
    return PopularMoviesResponse(movies: result);
  }
}

class Movie {
  final String title;
  final String posterUrl;
  final String overview;

  Movie({this.title, this.posterUrl, this.overview});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["title"],
        posterUrl: json["poster_path"],
        overview: json["overview"]);
  }
}
