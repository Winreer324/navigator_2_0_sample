
class Book {
  final int id;
  final String title;
  final String author;

  Book({required this.id, required this.title, required this.author});

  @override
  String toString() => 'id:$id title:$title author:$author';
}
