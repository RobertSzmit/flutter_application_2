import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_2/app/models/schedule_item_model.dart';
import 'package:flutter_application_2/app/repositories/schedule_repository.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  final ScheduleRepository _repository;

  ScheduleCubit(this._repository)
      : super(
          const ScheduleState(
            schedules: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const ScheduleState(
        schedules: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = _repository.streamScheduleItems().listen(
      (schedules) {
        emit(
          ScheduleState(
            schedules: schedules,
            isLoading: false,
            errorMessage: '',
          ),
        );
      },
      onError: (error) {
        emit(
          ScheduleState(
            schedules: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}