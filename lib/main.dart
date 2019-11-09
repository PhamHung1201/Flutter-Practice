import 'package:flutter/material.dart';
import 'package:flutter_practice/Provider.dart';
import 'package:flutter_practice/ui/MovieList.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Provider(
      child: MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(
          body: ArtistList(),
        ),
      ),
    );
  }
}
