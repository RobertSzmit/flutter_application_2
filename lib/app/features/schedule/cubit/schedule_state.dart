part of 'schedule_cubit.dart';

@immutable
class ScheduleState {
  final List<ScheduleItem> schedules;
  final bool isLoading;
  final String errorMessage;

  const ScheduleState({
    required this.schedules,
    required this.isLoading,
    required this.errorMessage,
  });
}