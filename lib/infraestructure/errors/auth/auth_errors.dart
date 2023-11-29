class WrongCredentials {}

class InvalidToken implements Exception {
  final String message;
  InvalidToken(this.message);

  @override
  String toString() => 'DataValidationException: $message';
}

class ConnectionTimeout {}

class CustomError {
  final int statusCode;
  final String message;

  CustomError({required this.statusCode, required this.message});
}
