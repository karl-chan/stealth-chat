import 'dart:developer';

import 'package:logging/logging.dart';

void logDebug(String message) {
  log(message, level: Level.FINE.value);
}

void logInfo(String message) {
  log(message, level: Level.INFO.value);
}

void logWarn(String message) {
  log(message, level: Level.WARNING.value);
}

void logError(String message) {
  log(message, level: Level.SEVERE.value);
}
