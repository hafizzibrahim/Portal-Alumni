import 'package:flutter/cupertino.dart';

import '../models/JobsModel.dart';
import '../services/ApiService.dart';

class CareerViewModel extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List<Job> jobs = [];

  Future<void> fetchJobs() async {
    try {
      jobs = await apiService.getJobs();
      notifyListeners();
    } catch (e) {
      print('Error fetching jobs: $e');
    }
  }
}