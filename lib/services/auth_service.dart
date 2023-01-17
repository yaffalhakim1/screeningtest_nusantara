import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:screeningtest_nusantara/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'https://basic-book-crud-e3u54evafq-et.a.run.app';

  Future<UserModel> register({
    String? name,
    String? email,
    String? password,
    String? passwordConfirmation,
  }) async {
    var url = '$baseUrl/api/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'name': name,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['token'];
      debugPrint('[register] : ${response.body}, ${response.statusCode}');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', user.token!);

      prefs.setString('email', user.email!);
      prefs.setString('password', user.password!);

      return user;
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/api/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data);
      user.token = 'Bearer ' + data['token'];
      debugPrint('[login] : ${response.body}');

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', user.token!);
      return user;
    } else {
      throw Exception(jsonDecode(response.body)['message']);
    }
  }

  Future logout() async {
    try {
      var url = '$baseUrl/api/user/logout';
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      var headers = {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: "Bearer $token"
      };

      var logout = await http.delete(
        Uri.parse(url),
        headers: headers,
      );

      if (logout.statusCode == 200) {
        debugPrint('[logout] : ${logout.body}');
        prefs.remove('token');
      } else {
        throw Exception(jsonDecode(logout.body)['message']);
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
