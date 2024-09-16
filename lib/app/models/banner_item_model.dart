import 'package:json_annotation/json_annotation.dart';

part 'banner_item_model.g.dart';

@JsonSerializable()
class BannerItem {
  BannerItem({
    required this.id,
    required this.date,
    required this.team1Name,
    required this.team1Logo,
    required this.team1Score,
    required this.team2Name,
    required this.team2Logo,
    required this.team2Score,
  });

  final String id;
  final String date;
  final String team1Name;
  final String team1Logo;
  final String team1Score;
  final String team2Name;
  final String team2Logo;
  final String team2Score;

  factory BannerItem.fromJson(Map<String, dynamic> json) =>
      _$BannerItemFromJson(json);

  Map<String, dynamic> toJson() => _$BannerItemToJson(this);
}
