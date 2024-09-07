import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_2/app/models/schedule_item_model.dart';

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
      final schedules = snapshot.docs.map((doc) => ScheduleItem(
            id: doc.id,
            date: doc['date'] ?? '',
            homeTeam: doc['home_team'] ?? '',
            awayTeam: doc['away_team'] ?? '',
            score: doc['score'],
          )).toList();
      emit(
        ScheduleState(
          schedules: schedules,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          ScheduleState(
            schedules: const [],
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