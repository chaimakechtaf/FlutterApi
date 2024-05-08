import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:pfe_ecommerce/services/dio.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool get authenticated => _isLoggedIn;

  Future<void> login(Map<String, String> creds, BuildContext context) async {
    try {
      Dio.Response response = await dio().post('/sanctum/token', data: creds);
      print(response.data.toString());

      _isLoggedIn = true;
      notifyListeners();

      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email ou mot de passe incorrect'),
          duration: Duration(seconds: 5),
        ),
      );
      print(e);
    }
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
