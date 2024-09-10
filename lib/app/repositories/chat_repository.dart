import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/app/models/chat_item_model.dart';

class ChatRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<ChatItem>> streamChatMessages() {
    return FirebaseFirestore.instance
        .collection('chat')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            final data = doc.data();
            return ChatItem(
              id: doc.id,
              message: data['message'] ?? '',
              userId: data['userId'] ?? '',
              username: data['username'] ?? 'Nieznany użytkownik',
              timestamp: data['timestamp'] ?? Timestamp.now(),
            );
          },
        ).toList();
      },
    );
  }

  Future<void> sendMessage(String message) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception('User not authenticated');
    }
    final userDoc = await _firestore.collection('users').doc(user.uid).get();
    final username =
        userDoc.data()?['username'] as String? ?? 'Nieznany użytkownik';

    await _firestore.collection('chat').add({
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
      'userId': user.uid,
      'username': username,
    });
  }
}
