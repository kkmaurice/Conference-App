import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../models/tour_guide.dart';

class TourGuideService {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('tourGuides');

  static Future<void> addTourGuide(TourGuide tourGuide) async {
    final id = const Uuid().v4();
    await FirebaseFirestore.instance
        .collection('tourGuides')
        .doc(id)
        .set(tourGuide.toMap(), SetOptions(merge: true));
  }

  Future getTourGuides() async {
    final snapshot = await _ref.get();
    return snapshot.docs
        .map((doc) => TourGuide.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
