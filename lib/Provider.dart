import 'package:flutter/material.dart';

import 'blocs/ArtistBloc.dart';

class Provider extends InheritedWidget {
  final bloc = ArtistBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ArtistBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
