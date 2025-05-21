extension DurationOnlyExtensions on Duration {
  /// Microseconds excluding full milliseconds
  int get onlyMicroseconds =>
      inMicroseconds % Duration.microsecondsPerMillisecond;

  /// Milliseconds excluding full seconds
  int get onlyMilliseconds => _calculateExcludingLargerUnits(
      Duration.microsecondsPerSecond, Duration.microsecondsPerMillisecond);

  /// Seconds excluding full minutes
  int get onlySeconds => _calculateExcludingLargerUnits(
      Duration.microsecondsPerMinute, Duration.microsecondsPerSecond);

  /// Minutes excluding full hours
  int get onlyMinutes => _calculateExcludingLargerUnits(
      Duration.microsecondsPerHour, Duration.microsecondsPerMinute);

  /// Hours excluding days
  int get onlyHours => _calculateExcludingLargerUnits(
      Duration.microsecondsPerDay, Duration.microsecondsPerHour);

  /// Full days
  int get onlyDays => inDays;

  /// Helper method to calculate time units excluding larger units
  int _calculateExcludingLargerUnits(int largerUnit, int smallerUnit) {
    return (inMicroseconds % largerUnit) ~/ smallerUnit;
  }
}
