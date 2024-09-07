import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_2/app/models/user_item_model.dart';

part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  MyAccountCubit()
      : super(const MyAccountState(isLoading: false, errorMessage: ''));

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StreamSubscription? _streamSubscription;

  Future<void> loadUserData() async {
    emit(const MyAccountState(isLoading: true, errorMessage: ''));
    try {
      final user = _auth.currentUser;
      if (user != null) {
        _streamSubscription = _firestore
            .collection('users')
            .doc(user.uid)
            .snapshots()
            .listen((snapshot) {
          final data = snapshot.data();
          if (data != null) {
            final userItem = UserItem(
              id: user.uid,
              username: data['username'] as String? ?? 'Nieznany użytkownik',
              email: user.email,
            );
            emit(MyAccountState(
                userItem: userItem, isLoading: false, errorMessage: ''));
          } else {
            emit(const MyAccountState(
                isLoading: false, errorMessage: 'Brak danych użytkownika'));
          }
        }, onError: (error) {
          emit(MyAccountState(
              isLoading: false,
              errorMessage: 'Błąd podczas pobierania danych: $error'));
        });
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
      await _auth.signOut();
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
