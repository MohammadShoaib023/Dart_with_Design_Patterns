/// This is the Logger class that follows the Singleton pattern.
class Logger {
  /// Private constructor
  Logger._internal();

  /// Singleton instance
  static final Logger _instance = Logger._internal();

  /// Factory constructor to return the same instance every time
  factory Logger() => _instance;

  /// Private list to store log messages
  static final List<String> _logMessages = [];

  /// Method to add a log message
  void log(String message) {
    final timeStampedMessage = '${DateTime.now()}: $message';
    _logMessages.add(timeStampedMessage);
    print(timeStampedMessage); // For demonstration, print the log message
  }

  /// Method to retrieve all log messages
  List<String> get logMessages => List.unmodifiable(_logMessages);

  /// Method to clear all log messages
  void clearLog() {
    _logMessages.clear();
  }
}

void main() {
  final logger1 = Logger();
  final logger2 = Logger();

  // Both logger1 and logger2 are the same instance
  logger1.log('First log message');
  logger2.log('Second log message');

  // Retrieve and print all log messages
  print(logger1.logMessages);

  // Clear log messages
  logger2.clearLog();

  // The log should now be empty
  print(logger1.logMessages);
}
