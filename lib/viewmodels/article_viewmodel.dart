import 'package:flutter/cupertino.dart';

import '../models/article_model.dart';
import '../services/ApiService.dart';

class ArticleViewmodel extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List<ArticleModel> articles = [];

  Future<void> getArticle() async {
    try {
      articles = await apiService.getArticle();
      notifyListeners();
    } catch (e) {
      print('Error fetching jobs: $e');
    }
  }
}