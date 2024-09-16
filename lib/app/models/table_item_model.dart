import 'package:json_annotation/json_annotation.dart';

part 'table_item_model.g.dart';

@JsonSerializable()
class TableItem {
  TableItem({
    required this.id,
    required this.teamName,
    required this.matches,
    required this.points,
    required this.goals,
  });

  final String id;
  final String teamName;
  final String matches;
  final int points;
  final String goals;

  factory TableItem.fromJson(Map<String, dynamic> json) => _$TableItemFromJson(json);

  Map<String, dynamic> toJson() => _$TableItemToJson(this);
}