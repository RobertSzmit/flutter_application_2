part of 'my_account_cubit.dart';

@immutable
class MyAccountState {
  final UserItem? userItem;
  final bool isLoading;
  final String errorMessage;

  const MyAccountState({
    this.userItem,
    required this.isLoading,
    required this.errorMessage,
  });
}