part of 'table_cubit.dart';

@immutable
class TableState {
  final List<TableItem> teams;
  final bool isLoading;
  final String errorMessage;

  const TableState({
    required this.teams,
    required this.isLoading,
    required this.errorMessage,
  });
}
