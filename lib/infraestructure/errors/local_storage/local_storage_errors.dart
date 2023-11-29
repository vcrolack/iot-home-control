class DatabaseConnectionException implements Exception {
  final String message;
  DatabaseConnectionException(this.message);

  @override
  String toString() => 'DatabaseConnectionException: $message';
}

class DataValidationException implements Exception {
  final String message;
  DataValidationException(this.message);

  @override
  String toString() => 'DataValidationException: $message';
}

class DatabaseOperationException implements Exception {
  final String message;
  DatabaseOperationException(this.message);

  @override
  String toString() => 'DatabaseOperationException: $message';
}

class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException(this.message);

  @override
  String toString() => 'UserNotFoundException: $message';
}
