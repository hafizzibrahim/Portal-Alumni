import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/ApiService.dart';

class LoginViewModel extends ChangeNotifier {
  final ApiService apiService = ApiService();

  Future<void> login(String email, String password) async {
    try {
      final response = await apiService.loginUser(email, password);

      // Save user data to SharedPreferences if login successful
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.token);
      await prefs.setString('userId', response.id);
      await prefs.setString('email', response.email);

      print('Login successful');
    } catch (e) {
      throw e;
    }
  }
}
