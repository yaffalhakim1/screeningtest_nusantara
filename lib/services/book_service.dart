import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:screeningtest_nusantara/models/books_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/book_add_model.dart';

String baseUrl = 'https://basic-book-crud-e3u54evafq-et.a.run.app';

class BookService {
  Future<BookResponseModel> getBook() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    try {
      var url = Uri.parse('$baseUrl/api/books');
      var headers = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer $token"
      };
      var books = await http.get(url, headers: headers);
      if (books.statusCode == 200) {
        var data = jsonDecode(books.body);
        debugPrint('[getBook] : ${books.body}, ${books.statusCode}');

        BookResponseModel bookResponseModel = BookResponseModel.fromJson(data);
        return bookResponseModel;
      }
      return BookResponseModel.fromJson(
        {
          "meta": {
            'status': 'error',
            'message': 'Error',
          },
          // "data": [],
        },
      );
    } catch (e) {
      return BookResponseModel.fromJson(
        {
          "meta": {
            'status': 'error',
            'message': '$e',
          },
          // "data": [],
        },
      );
    }
  }

  Future<BookResponseModel> addBook({
    BookAddModel? bookAddModel,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    try {
      var url = Uri.parse('$baseUrl/api/books/add');
      dynamic headers = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var books = await http.post(
        url,
        headers: headers,
        body: jsonEncode(bookAddModel?.toJson()),
      );

      var data = jsonDecode(books.body);

      BookResponseModel bookResponseModel = BookResponseModel.fromJson(data);
      return bookResponseModel;
    } catch (e) {
      return BookResponseModel.fromJson(
        {
          "meta": {
            'status': 'error',
            'message': '$e',
          },
          // "data": [],
        },
      );
    }
  }

  Future deleteBook({
    String? id,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    try {
      var url = Uri.parse('$baseUrl/delete/$id');
      dynamic headers = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer $token"
      };

      var books = await http.delete(
        url,
        headers: headers,
      );

      var data = jsonDecode(books.body);
      BookResponseModel bookResponseModel = BookResponseModel.fromJson(data);
      return bookResponseModel;
    } catch (e) {
      return BookResponseModel.fromJson(
        {
          "meta": {
            'status': 'error',
            'message': '$e',
          },
          // "data": [],
        },
      );
    }
  }

  //create edit books function
  Future<BookResponseModel> editBook({
    BookAddModel? bookAddModel,
    String? id,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    try {
      var url = Uri.parse('$baseUrl/api/books/edit/$id');
      dynamic headers = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer $token",
      };

      var books = await http.put(
        url,
        headers: headers,
        body: jsonEncode(bookAddModel?.toJson()),
      );

      var data = jsonDecode(books.body);

      BookResponseModel bookResponseModel = BookResponseModel.fromJson(data);
      return bookResponseModel;
    } catch (e) {
      return BookResponseModel.fromJson(
        {
          "meta": {
            'status': 'error',
            'message': '$e',
          },
          // "data": [],
        },
      );
    }
  }
}
