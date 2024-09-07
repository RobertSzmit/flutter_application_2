class UserItem {
  UserItem({
    required this.id,
    required this.username,
    this.email,
  });

  final String id;
  final String username;
  final String? email;
}