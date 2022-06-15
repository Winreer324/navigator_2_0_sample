import 'package:flutter/material.dart';

import 'home_details_screen.dart';

class DetailsPage extends Page {
  static const String routeName = 'details';

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return const HomeDetailsScreen();
      },
    );
  }
}
