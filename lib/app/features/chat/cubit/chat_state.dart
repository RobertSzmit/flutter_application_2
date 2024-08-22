part of 'chat_cubit.dart';

@immutable
class ChatState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> messages;
  final bool isLoading;
  final String errorMessage;

  const ChatState({
    required this.messages,
    required this.isLoading,
    required this.errorMessage,
  });
}
