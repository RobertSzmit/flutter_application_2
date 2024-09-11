import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/app/models/table_item_model.dart';
import 'package:flutter_application_2/app/repositories/table_repository.dart';
import 'package:meta/meta.dart';

part 'table_state.dart';

class TableCubit extends Cubit<TableState> {
  final TableRepository _repository;

  TableCubit(this._repository)
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

    _streamSubscription = _repository.streamTableItems().listen(
      (tableItems) {
        emit(
          TableState(
            teams: tableItems,
            isLoading: false,
            errorMessage: '',
          ),
        );
      },
      onError: (error) {
        emit(
          TableState(
            teams: const [],
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