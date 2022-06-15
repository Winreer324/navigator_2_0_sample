import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int? id;

  const DetailScreen({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (id != null) Text('Viewing details for item $id') else const Text('details screen'),
            ElevatedButton(
              child: const Text('Pop!'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
