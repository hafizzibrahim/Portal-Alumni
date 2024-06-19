import 'dart:convert';

import '../models/SurveyModel.dart';
import '../models/UserModel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://helloworld1978.my.id/api";

  Future<UserModel> loginUser(String email, String password) async {
    final String url = '$baseUrl/users/login';
    final response = await http.post(Uri.parse(url), body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<SurveyModel> submitSurvey(Map<String, dynamic> surveyData) async {
    final String url = '$baseUrl/survey';
    final response = await http.post(Uri.parse(url), body: surveyData);

    if (response.statusCode == 200) {
      return SurveyModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to submit survey');
    }
  }
}