import '../../consts.dart';
import '../utc_flag.dart';

/// Extension on [DateTime] to add various durations.
extension DateTimeAddDurationExtension on DateTime {
  /// Returns a new [DateTime] with the specified number of [milliseconds] added.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime future = now.addMilliseconds(500);
  /// ```
  DateTime addMilliseconds(int milliseconds) {
    return add(Duration(milliseconds: milliseconds));
  }

  /// Returns a new [DateTime] with the specified number of [seconds] added.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime future = now.addSeconds(30);
  /// ```
  DateTime addSeconds(int seconds) {
    return add(Duration(seconds: seconds));
  }

  /// Returns a new [DateTime] with the specified number of [minutes] added.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime future = now.addMinutes(15);
  /// ```
  DateTime addMinutes(int minutes) {
    return add(Duration(minutes: minutes));
  }

  /// Returns a new [DateTime] with the specified number of [hours] added.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime future = now.addHours(2);
  /// ```
  DateTime addHours(int hours) {
    return add(Duration(hours: hours));
  }

  /// Returns a new [DateTime] with the specified number of [days] added.
  ///
  /// This method preserves the exact time of day and is not equivalent to adding
  /// 24 hours. It will keep the same time but move to the specified number of
  /// days in the future, which is important for daylight saving time handling.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime future = now.addDays(7); // Same time, 7 days later
  /// ```
  DateTime addDays(int days) {
    return copyWithSameUtcFlag(day: day + days);
  }

  /// Returns a new [DateTime] with the specified number of [weeks] added.
  ///
  /// This method preserves the exact time of day and is not equivalent to adding
  /// 168 hours (7 × 24). It will keep the same time but move to the specified
  /// number of weeks in the future, which is important for daylight saving time handling.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime.now();
  /// DateTime future = now.addWeeks(3); // Same time, 3 weeks later
  /// ```
  DateTime addWeeks(int weeks) {
    return addDays(weeks * TimePlusConsts.daysInWeek);
  }

  /// Returns a new [DateTime] with one millisecond added.
  DateTime get addMillisecond => addMilliseconds(1);

  /// Returns a new [DateTime] with one second added.
  DateTime get addSecond => addSeconds(1);

  /// Returns a new [DateTime] with one minute added.
  DateTime get addMinute => addMinutes(1);

  /// Returns a new [DateTime] with one hour added.
  DateTime get addHour => addHours(1);

  /// Returns a new [DateTime] with one day added.
  DateTime get addDay => addDays(1);

  /// Returns a new [DateTime] with one week added.
  DateTime get addWeek => addWeeks(1);
}
