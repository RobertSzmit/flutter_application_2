part of 'my_account_cubit.dart';

abstract class MyAccountState {}

class MyAccountInitial extends MyAccountState {}

class MyAccountLoading extends MyAccountState {}

class MyAccountLoaded extends MyAccountState {
  final String username;
  final String? email;

  MyAccountLoaded({required this.username, this.email});
}

class MyAccountError extends MyAccountState {
  final String message;

  MyAccountError(this.message);
}

class MyAccountSignedOut extends MyAccountState {}