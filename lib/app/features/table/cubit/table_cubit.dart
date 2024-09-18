import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/app/models/table_item_model.dart';
import 'package:flutter_application_2/app/repositories/table_repository.dart';

import 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  final TableRepository _repository;

  TableCubit(this._repository) : super(const TableState());

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(state.copyWith(isLoading: true, teams: []));

    _streamSubscription = _repository.streamTableItems().listen(
      (tableItems) {
        emit(state.copyWith(
          teams: tableItems,
          isLoading: false,
        ));
      },
      onError: (error) {
        emit(state.copyWith(
          teams: [],
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