import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/Provider.dart';
import 'package:flutter_practice/models/MovieResponse.dart';

class ArtistList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
//    bloc.fetchArtist();
    return Scaffold(
      appBar: AppBar(
        title: Text('Artists'),
      ),
      body: StreamBuilder(
        stream: bloc.fetchPopularMovie(),
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

  Widget buildList(AsyncSnapshot<PopularMoviesResponse> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.movies.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            Image.network(
              snapshot.data.movies[index].posterUrl,
            )
//            Text(
//              snapshot.data.movies[index].title,
//              style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic, color: Colors.deepOrange),
//            ),
          ],
        );
      },
    );

  }
}