class User {
  final int id;
  final String username;
  final String email;
  final String password;
  final String location;
  final String notifySettings;
  final String cognitoUserId;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.password,
      required this.location,
      required this.notifySettings,
      required this.cognitoUserId});
}
