part of 'news_cubit.dart';

@immutable
class NewsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const NewsState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
