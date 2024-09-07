import 'package:cloud_firestore/cloud_firestore.dart';

class ChatItem {
  ChatItem({
    required this.id,
    required this.message,
    required this.userId,
    required this.username,
    required this.timestamp,
  });

  final String id;
  final String message;
  final String userId;
  final String username;
  final Timestamp timestamp;
}
