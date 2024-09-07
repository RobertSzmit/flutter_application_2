class ScheduleItem {
  ScheduleItem({
    required this.id,
    required this.date,
    required this.homeTeam,
    required this.awayTeam,
    this.score,
  });

  final String id;
  final String date;
  final String homeTeam;
  final String awayTeam;
  final String? score;
}