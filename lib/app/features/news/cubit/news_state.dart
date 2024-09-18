import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_application_2/app/models/news_item_model.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    @Default([]) List<NewsItem> newsItems,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _NewsState;
}