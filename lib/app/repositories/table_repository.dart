import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/app/models/table_item_model.dart';

class TableRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<TableItem>> streamTableItems() {
    return _firestore
        .collection('table')
        .orderBy('points', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return TableItem(
          id: doc.id,
          teamName: doc['team_name'],
          matches: doc['matches'],
          points: doc['points'],
          goals: doc['goals'],
        );
      }).toList();
    });
  }
}