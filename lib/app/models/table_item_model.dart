import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_item_model.freezed.dart';
part 'table_item_model.g.dart';

@freezed
class TableItem with _$TableItem {
  const factory TableItem({
    required String id,
    required String teamName,
    required String matches,
    required int points,
    required String goals,
  }) = _TableItem;

  factory TableItem.fromJson(Map<String, dynamic> json) =>
      _$TableItemFromJson(json);
}