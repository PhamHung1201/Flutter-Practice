import 'package:flutter/material.dart';

import 'blocs/MovieBloc.dart';

class Provider extends InheritedWidget {
  final bloc = PopularMovieBloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static PopularMovieBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
