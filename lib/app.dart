import 'package:flutter/material.dart';
import 'package:flutter_practice/ui/ArtistList.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: ArtistList(),
      ),
    );
  }
}
