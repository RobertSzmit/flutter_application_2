class NewsItem {
  final String id;
  final String title;
  final String content;
  final String? imageUrl;
  final String? details;

  NewsItem({
    required this.id,
    required this.title,
    required this.content,
    this.imageUrl,
    this.details,
  });
}
