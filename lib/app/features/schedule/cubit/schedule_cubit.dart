import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'schedule_state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit()
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

    _streamSubscription = FirebaseFirestore.instance
        .collection('schedule')
        .snapshots()
        .listen((snapshot) {
      emit(
        ScheduleState(
          schedules: snapshot.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          ScheduleState(
            schedules: [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
