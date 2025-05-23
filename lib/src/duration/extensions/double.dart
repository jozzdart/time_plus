extension DoubleSmartDuration on double {
  /// Returns a [Duration] object representing the number of days.
  Duration get days => _smartDuration(this, Duration.millisecondsPerDay);

  /// Returns a [Duration] object representing the number of hours.
  Duration get hours => _smartDuration(this, Duration.millisecondsPerHour);

  /// Returns a [Duration] object representing the number of minutes.
  Duration get minutes => _smartDuration(this, Duration.millisecondsPerMinute);

  /// Returns a [Duration] object representing the number of seconds.
  Duration get seconds => _smartDuration(this, Duration.millisecondsPerSecond);

  /// Returns a [Duration] object representing the number of milliseconds.
  Duration get milliseconds => _smartDuration(this, 1);

  /// Returns a [Duration] object representing the number of microseconds.
  Duration get microseconds => _smartDuration(this, 1000);
}

/// Decomposes a double [value] into a [Duration] starting from [baseMillis] (e.g. 86400000 for days),
/// and breaks it into progressively smaller units down to microseconds.
Duration _smartDuration(double value, int baseMillis) {
  final isNegative = value < 0;
  int remainingMicros = (value.abs() * baseMillis * 1000).round();

  int days = 0,
      hours = 0,
      minutes = 0,
      seconds = 0,
      milliseconds = 0,
      microseconds = 0;

  if (baseMillis >= Duration.millisecondsPerDay) {
    days = remainingMicros ~/ Duration.microsecondsPerDay;
    remainingMicros %= Duration.microsecondsPerDay;
  }
  if (baseMillis >= Duration.millisecondsPerHour) {
    hours = remainingMicros ~/ Duration.microsecondsPerHour;
    remainingMicros %= Duration.microsecondsPerHour;
  }
  if (baseMillis >= Duration.millisecondsPerMinute) {
    minutes = remainingMicros ~/ Duration.microsecondsPerMinute;
    remainingMicros %= Duration.microsecondsPerMinute;
  }
  if (baseMillis >= Duration.millisecondsPerSecond) {
    seconds = remainingMicros ~/ Duration.microsecondsPerSecond;
    remainingMicros %= Duration.microsecondsPerSecond;
  }
  if (baseMillis >= 1) {
    milliseconds = remainingMicros ~/ Duration.microsecondsPerMillisecond;
    remainingMicros %= Duration.microsecondsPerMillisecond;
  }

  microseconds = remainingMicros;

  final duration = Duration(
    days: days,
    hours: hours,
    minutes: minutes,
    seconds: seconds,
    milliseconds: milliseconds,
    microseconds: microseconds,
  );

  return isNegative ? -duration : duration;
}
