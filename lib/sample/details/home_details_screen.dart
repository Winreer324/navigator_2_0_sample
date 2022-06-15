import 'package:flutter/material.dart';

import 'details_page.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: const Text('View Details'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/${DetailsPage.routeName}/1',
            );
          },
        ),
      ),
    );
  }
}
