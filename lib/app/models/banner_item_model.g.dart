// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerItem _$BannerItemFromJson(Map<String, dynamic> json) => BannerItem(
      id: json['id'] as String,
      date: json['date'] as String,
      team1Name: json['team1Name'] as String,
      team1Logo: json['team1Logo'] as String,
      team1Score: json['team1Score'] as String,
      team2Name: json['team2Name'] as String,
      team2Logo: json['team2Logo'] as String,
      team2Score: json['team2Score'] as String,
    );

Map<String, dynamic> _$BannerItemToJson(BannerItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'team1Name': instance.team1Name,
      'team1Logo': instance.team1Logo,
      'team1Score': instance.team1Score,
      'team2Name': instance.team2Name,
      'team2Logo': instance.team2Logo,
      'team2Score': instance.team2Score,
    };
