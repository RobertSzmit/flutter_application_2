import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/app/features/chat/timestamp_converter.dart';

part 'chat_item_model.freezed.dart';
part 'chat_item_model.g.dart';

@freezed
class ChatItem with _$ChatItem {
  const factory ChatItem({
    required String id,
    required String message,
    required String userId,
    required String username,
    @TimestampConverter() required Timestamp timestamp,
  }) = _ChatItem;

  factory ChatItem.fromJson(Map<String, dynamic> json) =>
      _$ChatItemFromJson(json);
}