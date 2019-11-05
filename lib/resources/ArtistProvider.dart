import 'dart:convert';

import 'package:flutter_practice/models/ArtistResponse.dart';
import 'package:http/http.dart' as http;

class ArtistProvider {
  Future<ArtistResponse> fetchArtists() async {
    final response = await http.get(
        'http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&mbid=cc197bad-dc9c-440d-a5b5-d52ba2e14234&api_key=8a792b6a26a84d28a4690ce2cb445a75&format=json');

    if (response.statusCode == 200) {
      return ArtistResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
