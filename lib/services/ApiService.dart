import 'dart:convert';

import '../models/JobsModel.dart';
import '../models/SurveyModel.dart';
import '../models/UserModel.dart';
import 'package:http/http.dart' as http;

import '../models/article_model.dart';

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

  Future<List<Job>> getJobs() async {
    final String url = '$baseUrl/jobs';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((job) => Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  Future<List<ArticleModel>> getArticle() async {
    final String url = '$baseUrl/articles';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((articles) => ArticleModel.fromJson(articles)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}