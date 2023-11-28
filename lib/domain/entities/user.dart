class User {
  final String id;
  final bool emailVerified;
  final String customUserId;
  final String email;
  final String username;
  final String location;
  final String notificationSettings;
  final String cognitoUserId;
  final String idToken;
  final String accessToken;

  User({
    required this.id,
    required this.emailVerified,
    required this.customUserId,
    required this.email,
    required this.username,
    required this.location,
    required this.notificationSettings,
    required this.cognitoUserId,
    required this.idToken,
    required this.accessToken,
  });
}
