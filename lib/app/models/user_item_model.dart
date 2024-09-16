import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_item_model.freezed.dart';
part 'user_item_model.g.dart';

@freezed
class UserItem with _$UserItem {
  const factory UserItem({
    required String id,
    required String username,
    String? email,
  }) = _UserItem;

  factory UserItem.fromJson(Map<String, dynamic> json) =>
      _$UserItemFromJson(json);
}