import 'dart:convert';
import 'dart:io';

import 'package:flutter_practice/models/MovieResponse.dart';
import 'package:http/http.dart' as http;

const String HOST = "https://api.themoviedb.org/3/";

class MovieProvider {
  Future<PopularMoviesResponse> fetchPopularMovies() async {
    final response = await http.get(
        HOST+'movie/popular?api_key=670caaa6963da98dda61be940a7a888e'
    );

    if (response.statusCode == 200) {
      return PopularMoviesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
