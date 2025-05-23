extension DurationWithoutExtensions on Duration {
  static int _calculateRemainder(int totalUs, int microsecondsPerUnit) {
    return totalUs >= 0
        ? totalUs % microsecondsPerUnit
        : (microsecondsPerUnit - (-totalUs % microsecondsPerUnit)) %
            microsecondsPerUnit;
  }

  Duration _without(int microsecondsPerUnit) {
    final leftoverUs = _calculateRemainder(inMicroseconds, microsecondsPerUnit);
    return Duration(microseconds: leftoverUs);
  }

  /// Returns a [Duration] object representing the remainder of this duration
  /// after removing complete days.
  Duration get withoutDays => _without(Duration.microsecondsPerDay);

  /// Returns a [Duration] object representing the remainder of this duration
  /// after removing complete hours.
  Duration get withoutHours => _without(Duration.microsecondsPerHour);

  /// Returns a [Duration] object representing the remainder of this duration
  /// after removing complete minutes.
  Duration get withoutMinutes => _without(Duration.microsecondsPerMinute);

  /// Returns a [Duration] object representing the remainder of this duration
  /// after removing complete seconds.
  Duration get withoutSeconds => _without(Duration.microsecondsPerSecond);

  /// Returns a [Duration] object representing the remainder of this duration
  /// after removing complete milliseconds.
  Duration get withoutMilliseconds =>
      _without(Duration.microsecondsPerMillisecond);
}
