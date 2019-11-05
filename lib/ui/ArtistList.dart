import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/models/ArtistResponse.dart';
import '../blocs/ArtistBloc.dart';

class ArtistList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bloc.fetchArtist();
    return Scaffold(
      appBar: AppBar(
        title: Text('Artists'),
      ),
      body: StreamBuilder(
        stream: bloc.fetchArtist(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ArtistResponse> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.entryResponse.artists.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Text(snapshot.data.entryResponse.artists[index].name);
      },
    );
    
  }
}