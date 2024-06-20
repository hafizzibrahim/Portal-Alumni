import 'package:flutter/cupertino.dart';

import '../models/JobsModel.dart';
import '../services/ApiService.dart';

class CareerViewModel with ChangeNotifier {
  final ApiService apiService;

  CareerViewModel({required this.apiService});

  List<Job> _jobs = [];
  List<Job> _filteredJobs = [];
  String _searchQuery = '';

  List<Job> get jobs => _filteredJobs;

  Future<void> fetchJobs() async {
    try {
      _jobs = await apiService.getJobs();
      _filteredJobs = _jobs;
      notifyListeners();
    } catch (e) {
      // Handle error
      print(e);
    }
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