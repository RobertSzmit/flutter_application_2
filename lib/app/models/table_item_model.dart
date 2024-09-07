class TableItem {
  TableItem(
      // konstruktory do poniższych
      {required this.id,
      required this.teamName,
      required this.matches,
      required this.points,
      required this.goals});

  final String id; // parametry z table_page_view
  final String teamName;
  final String matches;
  final int points;
  final String goals;
}
