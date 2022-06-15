import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navigator_2_0/sample/book/book_model.dart';
import 'package:navigator_2_0/sample/colors/colors_page.dart';
import 'package:navigator_2_0/sample/details/details_page.dart';

class BooksListScreen extends StatelessWidget {
  static const String routeName = 'books';

  final List<Book> books;
  final ValueChanged<Book> onTapped;

  const BooksListScreen({
    Key? key,
    required this.books,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '${ColorsPage.routeName}',
                );
              },
              child: Text('open Colors screen')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '${DetailsPage.routeName}',
                );
              },
              child: Text('open details screen')),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '${DetailsPage.routeName}/${Random().nextInt(999)}',
                );
              },
              child: Text('open details random id screen')),
        ],
      ),
    );
  }
}
