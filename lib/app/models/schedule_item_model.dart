import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_item_model.freezed.dart';
part 'schedule_item_model.g.dart';

@freezed
class ScheduleItem with _$ScheduleItem {
  const factory ScheduleItem({
    required String id,
    required String date,
    required String homeTeam,
    required String awayTeam,
    String? score,
  }) = _ScheduleItem;

  factory ScheduleItem.fromJson(Map<String, dynamic> json) =>
      _$ScheduleItemFromJson(json);
}