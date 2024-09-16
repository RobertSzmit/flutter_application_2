// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableItem _$TableItemFromJson(Map<String, dynamic> json) => TableItem(
      id: json['id'] as String,
      teamName: json['teamName'] as String,
      matches: json['matches'] as String,
      points: (json['points'] as num).toInt(),
      goals: json['goals'] as String,
    );

Map<String, dynamic> _$TableItemToJson(TableItem instance) => <String, dynamic>{
      'id': instance.id,
      'teamName': instance.teamName,
      'matches': instance.matches,
      'points': instance.points,
      'goals': instance.goals,
    };
