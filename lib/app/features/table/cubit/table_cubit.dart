import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/app/models/table_item_model.dart';
import 'package:meta/meta.dart';

part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  TableCubit()
      : super(
          const TableState(
            teams: [],
            isLoading: false,
            errorMessage: '',
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const TableState(
        teams: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('table')
        .orderBy('points', descending: true)
        .snapshots()
        .listen((snapshot) {
      final tableItems = snapshot.docs.map((doc) {
        // w ten sposób mapujemy dane z firebase żeby zastosować model
        return TableItem(
          id: doc.id,
          teamName: doc['team_name'],
          matches: doc['matches'],
          points: doc['points'],
          goals: doc['goals'],
        );
      }).toList();
      emit(
        TableState(
          teams: tableItems,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          TableState(
            teams: const [],
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
