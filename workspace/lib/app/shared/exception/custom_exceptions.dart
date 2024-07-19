class CustomExceptions implements Exception {
  final String message;
  final Map<String, dynamic> logger;

  CustomExceptions(this.message, this.logger);
}
