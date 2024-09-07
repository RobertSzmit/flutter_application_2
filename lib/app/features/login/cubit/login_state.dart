part of 'login_cubit.dart';

@immutable
class LoginState {
  final UserItem? user;
  final bool isLoading;
  final String errorMessage;
  final bool isCreateAccount;

  const LoginState({
    this.user,
    required this.isLoading,
    required this.errorMessage,
    required this.isCreateAccount,
  });
}