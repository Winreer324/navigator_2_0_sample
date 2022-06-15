class BookRoutePath {
  final int? bookId;
  final int? detailsId;
  final bool isDetails;
  final bool isColors;
  final bool isUnknown;

  BookRoutePath.home()
      : bookId = null,
        detailsId = null,
        isDetails = false,
        isColors = false,
        isUnknown = false;

  BookRoutePath.detailsBook(this.bookId)
      : isUnknown = false,
        isDetails = false,
        isColors = false,
        detailsId = null;

  BookRoutePath.details()
      : bookId = null,
        isDetails = true,
        isUnknown = false,
        isColors = false,
        detailsId = null;

  BookRoutePath.detailsId(this.detailsId)
      : bookId = null,
        isDetails = false,
        isColors = false,
        isUnknown = false;

  BookRoutePath.colors()
      : isColors = true,
        bookId = null,
        isDetails = false,
        isUnknown = false,
        detailsId = null;

  BookRoutePath.unknown()
      : bookId = null,
        isDetails = false,
        isColors = false,
        isUnknown = true,
        detailsId = null;

  bool get isHomeBookPage => isUnknown == false && isColors == false && isDetailsPage == false;

  bool get isBookDetailsIdPage => bookId != null;

  bool get isDetailsPage => detailsId == null && isDetails;

  bool get isDetailsIdPage => detailsId != null;

  bool get isColorsPage => isColors;

  @override
  String toString() =>
      '\nisHomeBookPage:$isHomeBookPage\nisDetailsPage:$isDetailsPage\nisUnknown:$isUnknown\nisColors:$isColors';
}
