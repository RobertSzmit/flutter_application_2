import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:flutter_application_2/app/models/login_item_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(const LoginState(
          user: null,
          isLoading: false,
          errorMessage: '',
          isCreateAccount: false,
        ));

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  StreamSubscription? _streamSubscription;

  set password(String password) {}
  set email(String email) {}
  set username(String username) {}

  Future<void> signIn(String email, String password) async {
    emit(LoginState(
      user: null,
      isLoading: true,
      errorMessage: '',
      isCreateAccount: state.isCreateAccount,
    ));
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _streamSubscription = _firestore
          .collection('users')
          .doc(userCredential.user?.uid)
          .snapshots()
          .listen((snapshot) {
        final userData = snapshot.data();
        if (userData != null) {
          final user = UserItem(
            id: userCredential.user!.uid,
            email: email,
            username: userData['username'] ?? '',
          );
          emit(LoginState(
            user: user,
            isLoading: false,
            errorMessage: '',
            isCreateAccount: state.isCreateAccount,
          ));
        }
      });
    } catch (error) {
      emit(LoginState(
        user: null,
        isLoading: false,
        errorMessage: error.toString(),
        isCreateAccount: state.isCreateAccount,
      ));
    }
  }

  Future<void> signUp(String email, String password, String username) async {
    emit(LoginState(
      user: null,
      isLoading: true,
      errorMessage: '',
      isCreateAccount: state.isCreateAccount,
    ));
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(username);

      final user = UserItem(
        id: userCredential.user!.uid,
        email: email,
        username: username,
      );

      await _firestore.collection('users').doc(user.id).set({
        'username': username,
        'email': email,
      });

      emit(LoginState(
        user: user,
        isLoading: false,
        errorMessage: '',
        isCreateAccount: state.isCreateAccount,
      ));
    } catch (error) {
      emit(LoginState(
        user: null,
        isLoading: false,
        errorMessage: error.toString(),
        isCreateAccount: state.isCreateAccount,
      ));
    }
  }

  void toggleCreateAccount() {
    emit(LoginState(
      user: state.user,
      isLoading: state.isLoading,
      errorMessage: state.errorMessage,
      isCreateAccount: !state.isCreateAccount,
    ));
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
