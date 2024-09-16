import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_item_model.freezed.dart';
part 'login_item_model.g.dart';

@freezed
class LoginItem with _$LoginItem {
  const factory LoginItem({
    required String id,
    required String email,
    required String username,
  }) = _LoginItem;

  factory LoginItem.fromJson(Map<String, dynamic> json) =>
      _$LoginItemFromJson(json);
}