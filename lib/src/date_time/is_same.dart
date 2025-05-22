import '../consts.dart';

/// An extension on the `DateTime` class to provide methods for comparing
/// temporal precision between two `DateTime` instances.
extension DateTimeIsSameExtensions on DateTime {
  /// Checks if the current `DateTime` instance is in the same century as [other].
  ///
  /// Returns `true` if both instances have the same century.
  bool isSameCentury(DateTime other) {
    return year - year % TimePlusConsts.yearsInCentury ==
        other.year - other.year % TimePlusConsts.yearsInCentury;
  }

  /// Checks if the current `DateTime` instance is in the same decade as [other].
  ///
  /// Returns `true` if both instances have the same decade.
  bool isSameDecade(DateTime other) {
    return year - year % TimePlusConsts.yearsInDecade ==
        other.year - other.year % TimePlusConsts.yearsInDecade;
  }

  /// Checks if the current `DateTime` instance is in the same year as [other].
  ///
  /// Returns `true` if both instances have the same year.
  bool isSameYear(DateTime other) {
    return year == other.year;
  }

  /// Checks if the current `DateTime` instance is in the same month and year as [other].
  ///
  /// Returns `true` if both instances have the same year and month.
  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }

  /// Checks if the current `DateTime` instance is on the same day, month, and year as [other].
  ///
  /// Returns `true` if both instances have the same year, month, and day.
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Checks if the current `DateTime` instance is in the same hour, day, month, and year as [other].
  ///
  /// Returns `true` if both instances have the same year, month, day, and hour.
  bool isSameHour(DateTime other) {
    return isSameDay(other) && hour == other.hour;
  }

  /// Checks if the current `DateTime` instance is in the same minute, hour, day, month, and year as [other].
  ///
  /// Returns `true` if both instances have the same year, month, day, hour, and minute.
  bool isSameMinute(DateTime other) {
    return isSameHour(other) && minute == other.minute;
  }

  /// Checks if the current `DateTime` instance is in the same second, minute, hour, day, month, and year as [other].
  ///
  /// Returns `true` if both instances have the same year, month, day, hour, minute, and second.
  bool isSameSecond(DateTime other) {
    return isSameMinute(other) && second == other.second;
  }

  /// Checks if the current `DateTime` instance is in the same millisecond, second, minute, hour, day, month, and year as [other].
  ///
  /// Returns `true` if both instances have the same year, month, day, hour, minute, second, and millisecond.
  bool isSameMillisecond(DateTime other) {
    return isSameSecond(other) && millisecond == other.millisecond;
  }

  /// Checks if the current `DateTime` instance is in the same microsecond, millisecond, second, minute, hour, day, month, and year as [other].
  ///
  /// Returns `true` if both instances have the same year, month, day, hour, minute, second, millisecond, and microsecond.
  bool isSameMicrosecond(DateTime other) {
    return isSameMillisecond(other) && microsecond == other.microsecond;
  }
}
