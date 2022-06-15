import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  static const String routeName = '404';

  const UnknownScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('404!'),
      ),
    );
  }
}
