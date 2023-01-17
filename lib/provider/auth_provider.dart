import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user = UserModel(
    email: 'default',
    password: 'user pass',
    token: '',
  );

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;

      return true;
    } catch (error) {
      return false;
    }
  }

  Future register({
    String? name,
    String? email,
    String? password,
    String? passwordConfirmation,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

      _user = user;

      return true;
    } catch (error) {
      debugPrint(error.toString());

      return false;
    }
  }
}
