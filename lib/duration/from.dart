import '../core/consts.dart';

/// A utility class for creating [Duration] instances from various time units.
class DurationFrom {
  /// Creates a [Duration] representing the specified number of microseconds.
  static Duration microseconds(int microseconds) {
    return Duration(microseconds: microseconds);
  }

  /// Creates a [Duration] representing the specified number of milliseconds.
  static Duration milliseconds(int milliseconds) {
    return Duration(milliseconds: milliseconds);
  }

  /// Creates a [Duration] representing the specified number of seconds.
  static Duration seconds(int seconds) {
    return Duration(seconds: seconds);
  }

  /// Creates a [Duration] representing the specified number of minutes.
  static Duration minutes(int minutes) {
    return Duration(minutes: minutes);
  }

  /// Creates a [Duration] representing the specified number of hours.
  static Duration hours(int hours) {
    return Duration(hours: hours);
  }

  /// Creates a [Duration] representing the specified number of days.
  static Duration days(int days) {
    return Duration(days: days);
  }

  /// Creates a [Duration] representing the specified number of weeks.
  /// A week is considered to have 7 days.
  static Duration weeks(int weeks) {
    return Duration(days: weeks * TimePlusConsts.daysInWeek);
  }

  /// Creates a [Duration] representing the specified number of months.
  /// A month is considered to have 30 days.
  static Duration months(int months) {
    return Duration(days: months * TimePlusConsts.daysInMonth);
  }

  /// Creates a [Duration] representing the specified number of years.
  /// A year is considered to have 365 days.
  static Duration years(int years) {
    return Duration(days: years * TimePlusConsts.daysInYear);
  }

  /// Creates a [Duration] representing the specified number of decades.
  /// A decade is considered to have 3650 days.
  static Duration decades(int decades) {
    return Duration(days: decades * TimePlusConsts.daysInDecade);
  }

  /// Creates a [Duration] representing the specified number of centuries.
  /// A century is considered to have 36500 days.
  static Duration centuries(int centuries) {
    return Duration(days: centuries * TimePlusConsts.daysInCentury);
  }

  /// A constant [Duration] representing one century.
  static const Duration century = Duration(days: TimePlusConsts.daysInCentury);

  /// A constant [Duration] representing one decade.
  static const Duration decade = Duration(days: TimePlusConsts.daysInDecade);

  /// A constant [Duration] representing one year.
  static const Duration year = Duration(days: TimePlusConsts.daysInYear);

  /// A constant [Duration] representing one month.
  static const Duration month = Duration(days: TimePlusConsts.daysInMonth);

  /// A constant [Duration] representing one week.
  static const Duration week = Duration(days: TimePlusConsts.daysInWeek);

  /// A constant [Duration] representing one day.
  static const Duration day = Duration(days: 1);

  /// A constant [Duration] representing one hour.
  static const Duration hour = Duration(hours: 1);

  /// A constant [Duration] representing one minute.
  static const Duration minute = Duration(minutes: 1);

  /// A constant [Duration] representing one second.
  static const Duration second = Duration(seconds: 1);

  /// A constant [Duration] representing one millisecond.
  static const Duration millisecond = Duration(milliseconds: 1);

  /// A constant [Duration] representing one microsecond.
  static const Duration microsecond = Duration(microseconds: 1);
}
