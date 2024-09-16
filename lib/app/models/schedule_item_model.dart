import 'package:json_annotation/json_annotation.dart';

part 'schedule_item_model.g.dart';

@JsonSerializable()
class ScheduleItem {
  ScheduleItem({
    required this.id,
    required this.date,
    required this.homeTeam,
    required this.awayTeam,
    this.score,
  });

  final String id;
  final String date;
  final String homeTeam;
  final String awayTeam;
  final String? score;

  factory ScheduleItem.fromJson(Map<String, dynamic> json) => _$ScheduleItemFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleItemToJson(this);
}