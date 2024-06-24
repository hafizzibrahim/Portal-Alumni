import 'package:flutter/cupertino.dart';

import '../models/article_model.dart';
import '../services/ApiService.dart';

class ArticleViewModel with ChangeNotifier {
  final ApiService apiService;

  ArticleViewModel({required this.apiService});

  List<ArticleModel> _articles = [];
  List<ArticleModel> _filteredArticles = [];
  String _searchQuery = '';
  bool _isLoading = false;

  List<ArticleModel> get articles => _filteredArticles;
  bool get isLoading => _isLoading;

  Future<void> getArticle() async {
    _isLoading = true;
    notifyListeners();

    try {
      _articles = await apiService.getArticle();
      _filteredArticles = _articles; // Update filtered articles
    } catch (e) {
      print('Error fetching articles: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  void updateSearchArticleQuery(String query) {
    _searchQuery = query;
    if (_searchQuery.isEmpty) {
      _filteredArticles = _articles;
    } else {
      _filteredArticles = _articles.where((article) {
        return article.title.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
