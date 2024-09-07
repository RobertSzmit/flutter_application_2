import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_2/app/models/chat_item_model.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit()
      : super(
          const ChatState(
            messages: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> start() async {
    emit(
      const ChatState(
        messages: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = _firestore
        .collection('chat')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      final chatItems = snapshot.docs.map((doc) {
        final data = doc.data();
        return ChatItem(
          id: doc.id,
          message: data['message'] ?? '',
          userId: data['userId'] ?? '',
          username: data['username'] ?? 'Nieznany użytkownik',
          timestamp: data['timestamp'] ?? Timestamp.now(),
        );
      }).toList();
      emit(
        ChatState(
          messages: chatItems,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          ChatState(
            messages: [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> sendMessage(String message) async {
    if (message.isNotEmpty) {
      try {
        final user = _auth.currentUser;
        if (user != null) {
          final userDoc =
              await _firestore.collection('users').doc(user.uid).get();
          final username =
              userDoc.data()?['username'] as String? ?? 'Nieznany użytkownik';

          await _firestore.collection('chat').add({
            'message': message,
            'timestamp': FieldValue.serverTimestamp(),
            'userId': user.uid,
            'username': username,
          });
        }
      } catch (e) {
        emit(
          ChatState(
            messages: state.messages,
            isLoading: false,
            errorMessage: 'Nie udało się wysłać wiadomości: ${e.toString()}',
          ),
        );
      }
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
