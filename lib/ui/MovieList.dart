import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/Provider.dart';
import 'package:flutter_practice/models/MovieResponse.dart';

class ArtistList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
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
    return ListView.builder(
      itemCount: snapshot.data.movies.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0)),
                  child: Image.network(
                    snapshot.data.movies[index].posterUrl,
                    width: 150.0,
                    height: 200.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Text(snapshot.data.movies[index].title,
                      maxLines: 2,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.black)),
                )
              ],
            ));
      },
    );
  }
}
