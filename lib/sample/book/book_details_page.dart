
import 'package:flutter/material.dart';
import 'package:navigator_2_0/sample/book/book_model.dart';

import 'book_details_screen.dart';

class BookDetailsPage extends Page {
  static const String routeName = 'book';

  final Book book;

  BookDetailsPage({
    required this.book,
  }) : super(key: ValueKey(book));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return BookDetailsScreen(book: book);
      },
    );
  }
}
