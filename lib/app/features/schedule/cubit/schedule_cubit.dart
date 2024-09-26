import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/app/repositories/schedule_repository.dart';

import 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final ScheduleRepository _repository;

  ScheduleCubit(this._repository) : super(const ScheduleState());

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(state.copyWith(isLoading: true, schedules: []));

    _streamSubscription = _repository.streamScheduleItems().listen(
      (schedules) {
        emit(state.copyWith(
          schedules: schedules,
          isLoading: false,
        ));
      },
      onError: (error) {
        emit(state.copyWith(
          schedules: [],
          isLoading: false,
          errorMessage: error.toString(),
        ));
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}