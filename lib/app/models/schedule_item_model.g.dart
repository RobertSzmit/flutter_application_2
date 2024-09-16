// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleItemImpl _$$ScheduleItemImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleItemImpl(
      id: json['id'] as String,
      date: json['date'] as String,
      homeTeam: json['homeTeam'] as String,
      awayTeam: json['awayTeam'] as String,
      score: json['score'] as String?,
    );

Map<String, dynamic> _$$ScheduleItemImplToJson(_$ScheduleItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'homeTeam': instance.homeTeam,
      'awayTeam': instance.awayTeam,
      'score': instance.score,
    };
