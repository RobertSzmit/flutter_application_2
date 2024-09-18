import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_2/app/models/user_item_model.dart';
import 'package:flutter_application_2/app/repositories/my_account_repository.dart';

import 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  final MyAccountRepository _repository;

  MyAccountCubit(this._repository) : super(const MyAccountState());

  StreamSubscription? _streamSubscription;

  Future<void> loadUserData() async {
    emit(state.copyWith(isLoading: true, errorMessage: ''));
    try {
      final currentUser = _repository.getCurrentUser();
      if (currentUser != null) {
        _streamSubscription = _repository.getUserStream().listen(
          (userItem) {
            if (userItem != null) {
              emit(state.copyWith(
                  userItem: userItem, isLoading: false, errorMessage: ''));
            } else {
              emit(state.copyWith(
                  isLoading: false, errorMessage: 'Brak danych użytkownika'));
            }
          },
          onError: (error) {
            emit(state.copyWith(
                isLoading: false,
                errorMessage: 'Błąd podczas pobierania danych: $error'));
          },
        );
      } else {
        emit(state.copyWith(
            isLoading: false, errorMessage: 'Użytkownik nie jest zalogowany'));
      }
    } catch (e) {
      emit(state.copyWith(
          isLoading: false,
          errorMessage: 'Błąd podczas pobierania danych użytkownika: $e'));
    }
  }

  Future<void> signOut() async {
    try {
      await _repository.signOut();
      emit(const MyAccountState());
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, errorMessage: 'Błąd podczas wylogowywania: $e'));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}