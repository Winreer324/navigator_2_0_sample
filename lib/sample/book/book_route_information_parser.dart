import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:navigator_2_0/sample/book/book_route_path.dart';
import 'package:navigator_2_0/sample/colors/colors_page.dart';
import 'package:navigator_2_0/sample/details/home_details_page.dart';
import 'package:navigator_2_0/sample/unknown_screen.dart';

import 'book_details_page.dart';

class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  final bookPath = BookDetailsPage.routeName;
  final detailsPath = DetailsPage.routeName;
  final unknownPath = UnknownScreen.routeName;
  final colorsPath = ColorsPage.routeName;

  @override
  Future<BookRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');

    log('uri.pathSegments ${uri.pathSegments}', name: 'parseRouteInformation');
    // Handle '/'
    if (uri.pathSegments.isEmpty) {
      return BookRoutePath.home();
    }

    // Handle '/colors'
    if (uri.pathSegments.first == colorsPath) {
      return BookRoutePath.colors();
    }

    // Handle '/book/:id'
    if (uri.pathSegments.first == bookPath) {
      if (uri.pathSegments.length >= 2) {
        if (uri.pathSegments.first != bookPath) return BookRoutePath.unknown();
        String remaining = uri.pathSegments.skip(1).first;
        int? id = int.tryParse(remaining);

        if (id == null) return BookRoutePath.unknown();

        return BookRoutePath.detailsBook(id);
      }
    }

    // Handle '/details'
    if (uri.pathSegments.first == detailsPath) {
      if (uri.pathSegments.length >= 2) {
        // Handle '/details/:id'
        String remaining = uri.pathSegments.skip(1).first;
        int? id = int.tryParse(remaining);

        if (id == null) return BookRoutePath.details();

        return BookRoutePath.detailsId(id);
      } else {
        return BookRoutePath.details();
      }
    }

    // Handle unknown routes
    return BookRoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(BookRoutePath path) {
    if (path.isUnknown) {
      return  RouteInformation(location: '/$unknownPath');
    }

    /// colors page

    if (path.isColorsPage) {
      log('set colors path', name: 'colors');
      return RouteInformation(location: '/$colorsPath');
    }

    /// colors page

    /// details page

    if (path.isDetailsIdPage) {
      log('set home details by id path', name: 'details');
      return RouteInformation(location: '/$detailsPath/${path.detailsId}');
    }

    if (path.isDetailsPage) {
      log('set home path', name: 'details');
      return RouteInformation(location: '/$detailsPath');
    }

    /// details page

    /// book page

    if (path.isBookDetailsIdPage) {
      log('set book by id path', name: 'book');
      return RouteInformation(location: '/$bookPath/${path.bookId}');
    }

    /// book page

    if (path.isHomeBookPage) {
      log('set home path', name: 'home');
      return const RouteInformation(location: '/');
    }

    log('set empty path', name: 'restoreRouteInformation');

    return null;
  }
}
