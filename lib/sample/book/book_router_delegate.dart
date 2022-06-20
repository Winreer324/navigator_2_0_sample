import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:navigator_2_0/sample/book/book_details_screen.dart';
import 'package:navigator_2_0/sample/book/book_model.dart';
import 'package:navigator_2_0/sample/book/book_route_path.dart';
import 'package:navigator_2_0/sample/book/books_list_screen.dart';
import 'package:navigator_2_0/sample/colors/colors_page.dart';
import 'package:navigator_2_0/sample/colors/colors_screen.dart';
import 'package:navigator_2_0/sample/details/detail_screen.dart';
import 'package:navigator_2_0/sample/details/details_page.dart';
import 'package:navigator_2_0/sample/unknown_screen.dart';

import 'book_details_page.dart';

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  Book? _selectedBook;
  int? _selectedDetailsId;
  bool isShow404 = false;
  bool isDetailsPage = false;
  bool isColorsPage = false;

  final List<Book> books = [
    Book(id: 1, title: 'Left Hand of Darkness', author: 'Ursula K. Le Guin'),
    Book(
      id: 2,
      title: 'Too Like the Lightning',
      author: 'Ada Palmer',
    ),
    Book(id: 3, title: 'Kindred', author: 'Octavia E. Butler'),
  ];

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  BookRoutePath get currentConfiguration {
    if (isShow404) {
      return BookRoutePath.unknown();
    }

    /// book

    if (_selectedBook != null) {
      return BookRoutePath.detailsBook(books.indexOf(_selectedBook!));
    }

    /// details

    if (isDetailsPage && _selectedDetailsId == null) {
      return BookRoutePath.details();
    }

    if (isDetailsPage && _selectedDetailsId != null) {
      return BookRoutePath.detailsId(_selectedDetailsId);
    }

    /// details
    /// colors

    if (isColorsPage) {
      return BookRoutePath.colors();
    }

    /// colors

    return BookRoutePath.home();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('BooksListPage'),
          child: BooksListScreen(
            books: books,
            onTapped: _handleBookTapped,
          ),
        ),
        if (isShow404) const MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen()),
        if (_selectedBook != null && !isShow404) BookDetailsPage(book: _selectedBook!),
        if (isDetailsPage && !isShow404) const DetailsPage(),
        if (isDetailsPage && _selectedDetailsId != null) DetailsPage(id: _selectedDetailsId),
        if (isColorsPage) const ColorsPage(),
      ],
      // onGenerateRoute: _onGenerateRoute,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedBook = null;
        _selectedDetailsId = null;
        isDetailsPage = false;
        isShow404 = false;
        isColorsPage = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath path) async {
    if (path.isUnknown) {
      _selectedBook = null;
      _selectedDetailsId = null;
      isDetailsPage = false;
      isShow404 = true;
      isColorsPage = false;
      return;
    }

    /// book

    if (path.isBookDetailsIdPage) {
      final id = path.bookId;
      if (id != null) {
        if (id < 0 || id > books.length - 1) {
          isShow404 = true;
          return;
        }

        _selectedBook = books[id];
      } else {
        _selectedBook = null;
      }
    }

    /// book

    /// details

    if (path.isDetailsIdPage) {
      isDetailsPage = true;
      _selectedDetailsId = path.detailsId;
    }

    if (path.isDetailsPage) {
      isDetailsPage = true;
    }

    /// details

    if (path.isColorsPage) {
      isColorsPage = true;
      // if (navigatorKey.currentContext != null) {
      //   Navigator.pushNamed(
      //     navigatorKey.currentContext!,
      //     ColorsPage.routeName,
      //   );
      // }
    }

    isShow404 = false;
  }

  void _handleBookTapped(Book book) {
    _selectedBook = book;
    notifyListeners();
    // if (navigatorKey.currentContext != null) {
    //   Navigator.pushNamed(
    //     navigatorKey.currentContext!,
    //     '${BookDetailsPage.routeName}/${book.id}',
    //     arguments: book,
    //   );
    // }
  }

  Route? _onGenerateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name ?? '');
    log(uri.toString(), name: 'settings');

    late Widget page;

    if (uri.pathSegments.isEmpty) {
      page = BooksListScreen(
        books: books,
        onTapped: _handleBookTapped,
      );
    } else {
      final firstPath = uri.pathSegments.first;
      final maybeHaveIdInPath = uri.pathSegments.length >= 2;
      if (firstPath == DetailsPage.routeName) {
        if (maybeHaveIdInPath) {
          final id = int.tryParse(uri.pathSegments.skip(1).first);
          if (id != null) {
            page = DetailScreen(id: id);
          } else {
            page = const DetailScreen();
          }
        } else {
          page = const DetailScreen();
        }
      }

      if (firstPath == BookDetailsPage.routeName) {
        if (settings.arguments is Book) {
          page = BookDetailsScreen(
            book: settings.arguments as Book,
          );
        }
      }

      if (firstPath == ColorsPage.routeName) {
        page = const ColorsScreen();
      }
    }

    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
    );
  }
}
