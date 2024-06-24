import 'package:flutter/cupertino.dart';

import '../models/JobsModel.dart';
import '../services/ApiService.dart';

class CareerViewModel with ChangeNotifier {
  final ApiService apiService;

  CareerViewModel({required this.apiService});

  List<Job> _jobs = [];
  List<Job> _filteredJobs = [];
  String _searchQuery = '';
  bool _isLoading = false;

  List<Job> get jobs => _filteredJobs;
  bool get isLoading => _isLoading;

  Future<void> fetchJobs() async {
    _isLoading = true;
    notifyListeners();

    try {
      _jobs = await apiService.getJobs();
      _filteredJobs = _jobs;
    } catch (e) {
      // Handle error
      print(e);
    }

    _isLoading = false;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    if (_searchQuery.isEmpty) {
      _filteredJobs = _jobs;
    } else {
      _filteredJobs = _jobs.where((job) {
        return job.title.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
