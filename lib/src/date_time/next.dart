import 'utc_flag.dart';

extension DateTimeNextExtensions on DateTime {
  /// Returns the next occurrence of the given [weekday] and optional time.
  /// - Skips the current instance even if it matches.
  /// - [weekday]: 1 (Monday) to 7 (Sunday)
  DateTime nextWeekdayTime(
    int weekday, {
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  }) {
    final daysToAdd = (weekday - this.weekday + 7) % 7;
    var nextDate = add(Duration(days: daysToAdd == 0 ? 7 : daysToAdd));

    final result = withSameUtcFlag(
      nextDate.year,
      nextDate.month,
      nextDate.day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );

    return result;
  }

  /// Returns the next DateTime that matches the given time of day.
  /// If the time is earlier than now, rolls over to tomorrow.
  DateTime nextTimeOfDay({
    required int hour,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  }) {
    final today = withSameUtcFlag(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );

    return today.isAfter(this) ? today : today.add(const Duration(days: 1));
  }
}
