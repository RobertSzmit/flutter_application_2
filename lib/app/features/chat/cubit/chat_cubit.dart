import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> start() async {
    emit(
      const ChatState(
        messages: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('chat')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      emit(
        ChatState(
          messages: snapshot.docs,
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
        await FirebaseFirestore.instance.collection('chat').add({
          'message': message,
          'timestamp': FieldValue.serverTimestamp(),
        });
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
