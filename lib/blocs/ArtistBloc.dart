import 'package:flutter_practice/models/ArtistResponse.dart';
import 'package:flutter_practice/resources/ArtistProvider.dart';
import 'package:rxdart/rxdart.dart';

class ArtistBloc {
  final artistProvider = ArtistProvider();

  Observable<ArtistResponse> fetchArtist() {
    return Observable.fromFuture(artistProvider.fetchArtists());
  }
}
final bloc = ArtistBloc();
