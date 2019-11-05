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
