import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_application_2/app/models/table_item_model.dart';

part 'table_state.freezed.dart';

@freezed
class TableState with _$TableState {
  const factory TableState({
    @Default([]) List<TableItem> teams,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _TableState;
}