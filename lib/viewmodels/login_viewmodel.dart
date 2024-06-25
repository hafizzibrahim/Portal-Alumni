import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/UserModel.dart';
import '../services/ApiService.dart';

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
      await prefs.setInt('nim', response.nim);
      await prefs.setString('fakultas', response.fakultas);
      await prefs.setString('jurusan', response.jurusan);
      await prefs.setInt('tahun_lulus', response.tahunLulus);
      await prefs.setString('image_path', response.imagePath);

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
    final nim = prefs.getInt('nim');
    final fakultas = prefs.getString('fakultas');
    final jurusan = prefs.getString('jurusan');
    final tahunLulus = prefs.getInt('tahun_lulus');
    final imagePath = prefs.getString('image_path');

    if (token != null && userId != null && email != null && nim != null && fakultas != null && jurusan != null && tahunLulus != null && imagePath != null) {
      return UserModel(
        id: userId,
        email: email,
        nim: nim,// Sesuaikan dengan atribut yang sesuai
        fakultas: fakultas, // Sesuaikan dengan atribut yang sesuai
        jurusan: jurusan, // Sesuaikan dengan atribut yang sesuai
        tahunLulus: tahunLulus, // Sesuaikan dengan atribut yang sesuai
        imagePath: imagePath, // Sesuaikan dengan atribut yang sesuai
        token: token,
      );
    } else {
      throw Exception('User not logged in');
    }
  }
}
