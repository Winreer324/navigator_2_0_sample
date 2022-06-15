import 'package:flutter/material.dart';
import 'package:navigator_2_0/sample/book/book_route_information_parser.dart';
import 'package:navigator_2_0/sample/book/book_router_delegate.dart';


void main() {
  // runApp(Nav2App());
  runApp(const BooksApp());
}

class BooksApp extends StatefulWidget {
  const BooksApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  final BookRouterDelegate _routerDelegate = BookRouterDelegate();
  final BookRouteInformationParser _routeInformationParser = BookRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}