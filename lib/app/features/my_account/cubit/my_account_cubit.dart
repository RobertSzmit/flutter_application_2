import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'my_account_state.dart';

class MyAccountCubit extends Cubit<MyAccountState> {
  MyAccountCubit() : super(MyAccountInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> loadUserData() async {
    emit(MyAccountLoading());
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final doc = await _firestore.collection('users').doc(user.uid).get();
        final username = doc.data()?['username'] as String?;
        emit(MyAccountLoaded(username: username ?? 'Nieznany użytkownik', email: user.email));
      } else {
        emit(MyAccountError('Użytkownik nie jest zalogowany'));
      }
    } catch (e) {
      emit(MyAccountError('Błąd podczas pobierania danych użytkownika: $e'));
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      emit(MyAccountSignedOut());
    } catch (e) {
      emit(MyAccountError('Błąd podczas wylogowywania: $e'));
    }
  }
}