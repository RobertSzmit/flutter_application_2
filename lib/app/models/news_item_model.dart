import 'package:json_annotation/json_annotation.dart';

part 'news_item_model.g.dart';

@JsonSerializable()
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

  factory NewsItem.fromJson(Map<String, dynamic> json) => _$NewsItemFromJson(json);

  Map<String, dynamic> toJson() => _$NewsItemToJson(this);
}