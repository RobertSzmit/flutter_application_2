import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_application_2/app/models/banner_item_model.dart';

part 'news_banner_state.freezed.dart';

@freezed
class NewsBannerState with _$NewsBannerState {
  const factory NewsBannerState({
    @Default([]) List<BannerItem> bannerItems,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _NewsBannerState;
}