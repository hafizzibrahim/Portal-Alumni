import 'package:flutter/cupertino.dart';

import '../models/article_model.dart';
import '../services/ApiService.dart';

class ArticleViewmodel extends ChangeNotifier {
  final ApiService apiService;

  ArticleViewmodel({required this.apiService});

  List<ArticleModel> _articles = [];
  List<ArticleModel> _filteredArticle = [];
  String _searchQuery = '';

  List<ArticleModel> get articles => _filteredArticle;

  Future<void> getArticle() async {
    try {
      _articles = await apiService.getArticle();
      _filteredArticle = _articles; // Update filtered articles
      notifyListeners();
    } catch (e) {
      print('Error fetching articles: $e');
    }
  }

  void updateSearchArticleQuery(String query) {
    _searchQuery = query;
    if (_searchQuery.isEmpty) {
      _filteredArticle = _articles;
    } else {
      _filteredArticle = _articles.where((article) {
        return article.title.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
