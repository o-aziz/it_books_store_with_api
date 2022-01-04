import 'package:flutter/cupertino.dart';
import 'package:library_app/api/search.dart';
import 'package:library_app/model/books_data.model.dart';

class SearchBooksServices extends ChangeNotifier {
  String searchWord = "";
  BooksData? searchedBooks;
  int pageNumber = 1;
  int pages = 0;

  getPages(int totalBooks) {
    pages = (totalBooks / 10).ceil();
    notifyListeners();
  }

  Future getSearchedBooks({required String bookName, required int page}) async {
    searchedBooks = await searchData(bookName: bookName, page: page);
    notifyListeners();
  }
}
