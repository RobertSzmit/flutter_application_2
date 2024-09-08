part of 'news_cubit.dart';

@immutable
class NewsState {
  final List<NewsItem> newsItems;
  final bool isLoading;
  final String errorMessage;

  const NewsState({
    required this.newsItems,
    required this.isLoading,
    required this.errorMessage,
  });
}