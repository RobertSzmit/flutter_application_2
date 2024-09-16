import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_item_model.freezed.dart';
part 'banner_item_model.g.dart';

@freezed
class BannerItem with _$BannerItem {
  const factory BannerItem({
    required String id,
    required String date,
    required String team1Name,
    required String team1Logo,
    required String team1Score,
    required String team2Name,
    required String team2Logo,
    required String team2Score,
  }) = _BannerItem;

  factory BannerItem.fromJson(Map<String, dynamic> json) =>
      _$BannerItemFromJson(json);
}

