import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_item_model.freezed.dart';
part 'news_item_model.g.dart';

@freezed
class NewsItem with _$NewsItem {
  const factory NewsItem({
    required String id,
    required String title,
    required String content,
    String? imageUrl,
    String? details,
  }) = _NewsItem;

  factory NewsItem.fromJson(Map<String, dynamic> json) =>
      _$NewsItemFromJson(json);
}