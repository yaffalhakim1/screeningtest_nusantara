import 'package:flutter/cupertino.dart';
import 'package:screeningtest_nusantara/models/books_model.dart';

import '../models/book_add_model.dart';
import '../services/book_service.dart';

enum BookState { Empty, Loading, Success, Error }

String baseUrl = 'https://basic-book-crud-e3u54evafq-et.a.run.app';

class BookProvider with ChangeNotifier {
  BookState _bookState = BookState.Empty;
  BookState get bookState => _bookState;
  set bookState(BookState bookState) {
    _bookState = bookState;
    notifyListeners();
  }

  BookMetaModel _bookMetaModel = BookMetaModel();
  BookMetaModel get bookMetaModel => _bookMetaModel;
  set bookMetaModel(BookMetaModel bookMetaModel) {
    _bookMetaModel = bookMetaModel;
    notifyListeners();
  }

  BookResponseModel _bookResponseModel = BookResponseModel();
  BookResponseModel get bookResponseModel => _bookResponseModel;
  set bookResponseModel(BookResponseModel bookResponseModel) {
    _bookResponseModel = bookResponseModel;
    notifyListeners();
  }

  Future<void> getBooks() async {
    _bookState = BookState.Loading;
    notifyListeners();
    try {
      BookResponseModel bookResp = await BookService().getBook();
      if (bookResp.meta?.code == 200) {
        _bookState = BookState.Success;
        _bookResponseModel = bookResp;
        notifyListeners();
      } else {
        _bookState = BookState.Error;
        _bookMetaModel = bookResp.meta!;
        debugPrint('Error [get books]: ${bookResp.meta!.message}');
        notifyListeners();
      }
    } catch (e) {
      _bookState = BookState.Error;
      _bookMetaModel = BookMetaModel(code: 99, message: "$e", status: "error");
      notifyListeners();
    }
  }

  Future<void> addBooks({
    BookAddModel? bookAddModel,
  }) async {
    _bookState = BookState.Loading;
    notifyListeners();
    try {
      BookResponseModel bookAddResp = await BookService().addBook(
        bookAddModel: bookAddModel,
      );
      if (bookAddResp.meta?.code == 200) {
        _bookState = BookState.Success;
        _bookResponseModel = bookAddResp;
        notifyListeners();
      } else {
        _bookState = BookState.Error;
        _bookMetaModel = bookAddResp.meta!;
        debugPrint('Error [addbooks]: ${bookAddResp.meta!.message}');
        notifyListeners();
      }
    } catch (e) {
      _bookState = BookState.Error;
      print('Error: $e');
      _bookMetaModel = BookMetaModel(code: 99, message: "$e", status: "error");
      notifyListeners();
    }
  }
}
