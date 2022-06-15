import 'package:flutter/material.dart';

import 'detail_screen.dart';

class DetailsPage extends Page {
  static const String routeName = 'details';

  final int? id;

  const DetailsPage({this.id});

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return DetailScreen(id: id);
      },
    );
  }
}
