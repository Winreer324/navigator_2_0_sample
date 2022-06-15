import 'package:flutter/material.dart';
import 'package:navigator_2_0/sample/book/book_model.dart';

class BookDetailsScreen extends StatelessWidget {
  static const String routeName = 'book-details';

  final Book? book;

  const BookDetailsScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book != null) ...[
              Text('id ${book!.id}', style: Theme.of(context).textTheme.headline6),
              Text(book!.title, style: Theme.of(context).textTheme.headline6),
              Text(book!.author, style: Theme.of(context).textTheme.subtitle1),
            ] else
              Text('not found book')
          ],
        ),
      ),
    );
  }
}
