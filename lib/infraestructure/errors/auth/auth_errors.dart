class WrongCredentials {}

class InvalidToken {}

class ConnectionTimeout {}

class CustomError {
  final int statusCode;
  final String message;

  CustomError({required this.statusCode, required this.message});
}
