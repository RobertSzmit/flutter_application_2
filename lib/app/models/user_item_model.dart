import 'package:json_annotation/json_annotation.dart';

part 'user_item_model.g.dart';

@JsonSerializable()
class UserItem {
  UserItem({
    required this.id,
    required this.username,
    this.email,
  });

  final String id;
  final String username;
  final String? email;

  factory UserItem.fromJson(Map<String, dynamic> json) => _$UserItemFromJson(json);

  Map<String, dynamic> toJson() => _$UserItemToJson(this);
}