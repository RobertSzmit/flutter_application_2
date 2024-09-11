import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/app/models/schedule_item_model.dart';

class ScheduleRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<ScheduleItem>> streamScheduleItems() {
    return _firestore
        .collection('schedule')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return ScheduleItem(
          id: doc.id,
          date: data['date'] ?? '',
          homeTeam: data['home_team'] ?? '',
          awayTeam: data['away_team'] ?? '',
          score: data['score'],
        );
      }).toList();
    });
  }
}