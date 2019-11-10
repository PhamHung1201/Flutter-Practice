import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/Provider.dart';
import 'package:flutter_practice/models/view/MovieItemView.dart';

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

  Widget buildList(AsyncSnapshot<List<MovieItemView>> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.length,
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
                    snapshot.data[index].posterUrl,
                    width: 150.0,
                    height: 200.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 8.0)),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Text(snapshot.data[index].title,
                          maxLines: 2,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black)),
                      Padding(padding: EdgeInsets.only(bottom: 8.0)),
                      Text(snapshot.data[index].overview,
                          maxLines: 5,
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black54)),
                    ],
                  )
                ),
                Padding(padding: EdgeInsets.only(right: 8.0)),
              ],
            ));
      },
    );
  }
}
