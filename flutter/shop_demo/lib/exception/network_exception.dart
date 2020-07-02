class NetworkException implements Exception {
  final message;

  NetworkException([this.message]);

  String toString() {
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}
