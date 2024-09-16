import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_2/app/models/user_item_model.dart';
import 'package:flutter_application_2/app/repositories/my_account_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  final MyAccountRepository _repository;

  MyAccountCubit(this._repository)
      : super(const MyAccountState(isLoading: false, errorMessage: ''));

  StreamSubscription? _streamSubscription;

  Future<void> loadUserData() async {
    emit(const MyAccountState(isLoading: true, errorMessage: ''));
    try {
      final currentUser = _repository.getCurrentUser();
      if (currentUser != null) {
        _streamSubscription = _repository.getUserStream().listen(
          (userItem) {
            if (userItem != null) {
              emit(MyAccountState(
                  userItem: userItem, isLoading: false, errorMessage: ''));
            } else {
              emit(const MyAccountState(
                  isLoading: false, errorMessage: 'Brak danych użytkownika'));
            }
          },
          onError: (error) {
            emit(MyAccountState(
                isLoading: false,
                errorMessage: 'Błąd podczas pobierania danych: $error'));
          },
        );
      } else {
        emit(const MyAccountState(
            isLoading: false, errorMessage: 'Użytkownik nie jest zalogowany'));
      }
    } catch (e) {
      emit(MyAccountState(
          isLoading: false,
          errorMessage: 'Błąd podczas pobierania danych użytkownika: $e'));
    }
  }

  Future<void> signOut() async {
    try {
      await _repository.signOut();
      emit(const MyAccountState(isLoading: false, errorMessage: ''));
    } catch (e) {
      emit(MyAccountState(
          isLoading: false, errorMessage: 'Błąd podczas wylogowywania: $e'));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
