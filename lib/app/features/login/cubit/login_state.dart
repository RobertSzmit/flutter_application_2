part of 'login_cubit.dart';

@immutable
class LoginState {
  final LoginItem? user;
  final bool isLoading;
  final String errorMessage;
  final bool isCreateAccount;

  const LoginState({
    this.user,
    required this.isLoading,
    required this.errorMessage,
    required this.isCreateAccount,
  });

  LoginState copyWith({
    LoginItem? user,
    bool? isLoading,
    String? errorMessage,
    bool? isCreateAccount,
  }) {
    return LoginState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isCreateAccount: isCreateAccount ?? this.isCreateAccount,
    );
  }
}