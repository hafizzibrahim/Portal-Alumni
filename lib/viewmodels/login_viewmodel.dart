import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/UserModel.dart';
import '../services/ApiService.dart';

import 'package:flutter/material.dart';
// Ganti dengan path yang sesuai

class LoginViewModel extends ChangeNotifier {
  final ApiService apiService = ApiService();

  Future<void> login(String email, String password) async {
    try {
      final response = await apiService.loginUser(email, password);

      // Simpan data pengguna ke SharedPreferences jika login berhasil
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.token);
      await prefs.setString('userId', response.id);
      await prefs.setString('email', response.email);

      print('Login successful');
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('userId');
    await prefs.remove('email');

    print('Logout successful');
    notifyListeners();
  }

  Future<UserModel> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final userId = prefs.getString('userId');
    final email = prefs.getString('email');

    if (token != null && userId != null && email != null) {
      return UserModel(id: userId, email: email, token: token);
    } else {
      throw Exception('User not logged in');
    }
  }
}