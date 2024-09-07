class NewsItem {
  NewsItem({
    required this.id,
    required this.title,
    required this.content,
    this.imageUrl,
  });

  final String id;
  final String title;
  final String content;
  final String? imageUrl;
}