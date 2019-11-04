import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyHomePage());

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<ArtistResponse> artistResponse;

  @override
  void initState() {
    super.initState();
    artistResponse = fetchArtists();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Artists Data',
      home: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Fetch Artists Data'),
        ),
        body: Center(
          child: FutureBuilder<ArtistResponse>(
            future: artistResponse,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.entryResponse.artists.first.name);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Future<ArtistResponse> fetchArtists() async {
  final response = await http.get(
      'http://ws.audioscrobbler.com/2.0/?method=artist.getsimilar&mbid=cc197bad-dc9c-440d-a5b5-d52ba2e14234&api_key=8a792b6a26a84d28a4690ce2cb445a75&format=json');

  if (response.statusCode == 200) {
    return ArtistResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class ArtistResponse {
  final ArtistEntryResponse entryResponse;

  ArtistResponse({this.entryResponse});

  factory ArtistResponse.fromJson(Map<String, dynamic> json) {
    return ArtistResponse(entryResponse: ArtistEntryResponse.fromJson(json['similarartists']));
  }
}

class ArtistEntryResponse {
  final List<Artist> artists;

  ArtistEntryResponse({this.artists});

  factory ArtistEntryResponse.fromJson(Map<String, dynamic> json) {
    var list = json['artist'] as List;
    print(list.runtimeType);

    List<Artist> result = list.map((i) => Artist.fromJson(i)).toList();
    return ArtistEntryResponse(artists: result);
  }
}

class Artist {
  final String name;

  Artist({this.name});

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(name: json['name']);
  }
}
