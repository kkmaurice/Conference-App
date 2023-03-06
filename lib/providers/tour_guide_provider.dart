import 'package:flutter/material.dart';

import '../Services/tour_guide_service.dart';
import '../models/tour_guide.dart';

class TourGuideProvider with ChangeNotifier {
  List<TourGuide> _tourGuides = [];

  List<TourGuide> get tourGuides => _tourGuides;

  Future<List<TourGuide>> fetchTourGuides() async {
    var tour = await TourGuideService().getTourGuides();
    //print(tour);
    if (tour is List<TourGuide>) {
      _tourGuides = tour;
    }
    notifyListeners();
    return _tourGuides;
  }
}
