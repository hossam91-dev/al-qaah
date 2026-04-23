import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class LoggingService {
  static Future<void> initialize() async {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  static Future<void> logError(
    dynamic error, [
    StackTrace? stackTrace,
    bool fatal = false,
  ]) async {
    if (kReleaseMode) {
      await FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
        fatal: fatal,
      );
    } else {
      print('Logging Error: $error');
      if (stackTrace != null) {
        print('StackTrace: $stackTrace');
      }
    }
  }

  static Future<void> logMessage(String message) async {
    if (kReleaseMode) {
      await FirebaseCrashlytics.instance.log(message);
    } else {
      print('Log Message: $message');
    }
  }
}
