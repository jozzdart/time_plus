import '../../consts.dart';
import '../utc_flag.dart';

/// Extension on [DateTime] to subtract various durations.
extension DateTimeSubtractDurationsExtensions on DateTime {
  /// Returns a new [DateTime] with the specified number of [milliseconds] subtracted.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime past = now.subtractMilliseconds(500);
  /// ```
  DateTime subtractMilliseconds(int milliseconds) {
    return subtract(Duration(milliseconds: milliseconds));
  }

  /// Returns a new [DateTime] with the specified number of [seconds] subtracted.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime past = now.subtractSeconds(30);
  /// ```
  DateTime subtractSeconds(int seconds) {
    return subtract(Duration(seconds: seconds));
  }

  /// Returns a new [DateTime] with the specified number of [minutes] subtracted.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime past = now.subtractMinutes(15);
  /// ```
  DateTime subtractMinutes(int minutes) {
    return subtract(Duration(minutes: minutes));
  }

  /// Returns a new [DateTime] with the specified number of [hours] subtracted.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime past = now.subtractHours(2);
  /// ```
  DateTime subtractHours(int hours) {
    return subtract(Duration(hours: hours));
  }

  /// Returns a new [DateTime] with the specified number of [days] subtracted.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime past = now.subtractDays(7);
  /// ```
  DateTime subtractDays(int days) {
    return copyWithSameUtcFlag(day: day - days);
  }

  /// Returns a new [DateTime] with the specified number of [weeks] subtracted.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime past = now.subtractWeeks(3);
  /// ```
  DateTime subtractWeeks(int weeks) {
    return subtractDays(weeks * TimePlusConsts.daysInWeek);
  }

  /// Returns a new [DateTime] with one millisecond subtracted.
  DateTime get subtractMillisecond => subtractMilliseconds(1);

  /// Returns a new [DateTime] with one second subtracted.
  DateTime get subtractSecond => subtractSeconds(1);

  /// Returns a new [DateTime] with one minute subtracted.
  DateTime get subtractMinute => subtractMinutes(1);

  /// Returns a new [DateTime] with one hour subtracted.
  DateTime get subtractHour => subtractHours(1);

  /// Returns a new [DateTime] with one day subtracted.
  DateTime get subtractDay => subtractDays(1);

  /// Returns a new [DateTime] with one week subtracted.
  DateTime get subtractWeek => subtractWeeks(1);
}
