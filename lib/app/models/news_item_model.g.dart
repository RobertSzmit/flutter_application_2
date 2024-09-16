// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsItemImpl _$$NewsItemImplFromJson(Map<String, dynamic> json) =>
    _$NewsItemImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      imageUrl: json['imageUrl'] as String?,
      details: json['details'] as String?,
    );

Map<String, dynamic> _$$NewsItemImplToJson(_$NewsItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'imageUrl': instance.imageUrl,
      'details': instance.details,
    };
