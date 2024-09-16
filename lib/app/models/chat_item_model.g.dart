// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatItemImpl _$$ChatItemImplFromJson(Map<String, dynamic> json) =>
    _$ChatItemImpl(
      id: json['id'] as String,
      message: json['message'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String,
      timestamp:
          const TimestampConverter().fromJson(json['timestamp'] as Timestamp),
    );

Map<String, dynamic> _$$ChatItemImplToJson(_$ChatItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'userId': instance.userId,
      'username': instance.username,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };
