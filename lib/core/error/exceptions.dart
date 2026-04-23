class ServerException implements Exception {
  final String message;
  final String? code;

  const ServerException(this.message, {this.code});
}

class AuthException implements Exception {
  final String message;
  final String? code;

  const AuthException(this.message, {this.code});
}

class NetworkException implements Exception {}

class CacheException implements Exception {}
