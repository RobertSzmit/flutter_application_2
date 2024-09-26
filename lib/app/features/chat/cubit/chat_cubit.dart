import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/app/repositories/chat_repository.dart';

import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._chatRepository) : super(const ChatState());

  final ChatRepository _chatRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(state.copyWith(isLoading: true, messages: []));

    _streamSubscription = _chatRepository.streamChatMessages().listen(
      (chatItems) {
        emit(state.copyWith(
          messages: chatItems,
          isLoading: false,
        ));
      },
      onError: (error) {
        emit(state.copyWith(
          messages: [],
          isLoading: false,
          errorMessage: error.toString(),
        ));
      },
    );
  }

  Future<void> sendMessage(String message) async {
    if (message.isNotEmpty) {
      try {
        await _chatRepository.sendMessage(message);
      } catch (e) {
        emit(state.copyWith(
          errorMessage: 'Nie udało się wysłać wiadomości: ${e.toString()}',
        ));
      }
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}