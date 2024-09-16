import 'package:json_annotation/json_annotation.dart';

part 'login_item_model.g.dart';

@JsonSerializable()
class LoginItem {
  LoginItem({
    required this.id,
    required this.email,
    required this.username,
  });

  final String id;
  final String email;
  final String username;

  factory LoginItem.fromJson(Map<String, dynamic> json) =>
      _$LoginItemFromJson(json);

  Map<String, dynamic> toJson() => _$LoginItemToJson(this);
}