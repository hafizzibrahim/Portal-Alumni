import 'package:flutter/material.dart';

import '../models/StatisticDataModel.dart';
import '../services/ApiService.dart';

class DashoardViewmodel extends ChangeNotifier {
  final ApiService apiService;
  StatisticResponse? _statistics;
  bool _isLoading = false;

  DashoardViewmodel({required this.apiService});

  StatisticResponse? get statistics => _statistics;

  Future<void> fetchStatistics() async {
    if (_isLoading) return;
    _isLoading = true;
    try {
      print("Fetching statistics...");
      _statistics = await apiService.fetchStatistics();
      print("Statistics fetched successfully.");
      notifyListeners();
    } catch (e) {
      print("Failed to fetch statistics: $e");
    } finally {
      _isLoading = false;
    }
  }
}