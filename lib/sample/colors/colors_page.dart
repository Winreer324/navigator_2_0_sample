import 'package:flutter/material.dart';

import 'colors_screen.dart';

class ColorsPage extends Page {
  static const String routeName = 'colors';

  const ColorsPage();

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return const ColorsScreen();
      },
    );
  }
}
