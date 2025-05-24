import '../consts.dart';

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
    return Duration(days: weeks * DateTime.daysPerWeek);
  }

  /// Creates a [Duration] representing the specified number of months.
  /// Uses the average Gregorian calendar month length of 30.436875 days.
  static Duration months(int months) {
    return Duration(
        days: (months * TimePlusConsts.averageDaysPerMonth).round());
  }

  /// Creates a [Duration] representing the specified number of years.
  /// Uses the average Gregorian calendar year length of 365.2425 days.
  static Duration years(int years) {
    return Duration(days: (years * TimePlusConsts.averageDaysPerYear).round());
  }

  /// Creates a [Duration] representing the specified number of decades.
  /// Uses the average Gregorian calendar decade length of 3,652.425 days.
  static Duration decades(int decades) {
    return Duration(
        days: (decades * TimePlusConsts.averageDaysPerDecade).round());
  }

  /// Creates a [Duration] representing the specified number of centuries.
  /// Uses the average Gregorian calendar century length of 36,524.25 days.
  static Duration centuries(int centuries) {
    return Duration(
        days: (centuries * TimePlusConsts.averageDaysPerCentury).round());
  }

  /// A constant [Duration] representing one century.
  /// Uses an approximate value of 36,524 days for quick calculations.
  static const Duration century =
      Duration(days: TimePlusConsts.roundedDaysInCentury);

  /// A constant [Duration] representing one decade.
  /// Uses an approximate value of 3,652 days for quick calculations.
  static const Duration decade =
      Duration(days: TimePlusConsts.roundedDaysInDecade);

  /// A constant [Duration] representing one year.
  /// Uses an approximate value of 365 days for quick calculations.
  static const Duration year =
      Duration(days: TimePlusConsts.roundedDaysPerYear);

  /// A constant [Duration] representing one month.
  /// Uses an approximate value of 30 days for quick calculations.
  static const Duration month =
      Duration(days: TimePlusConsts.roundedDaysPerMonth);

  /// A constant [Duration] representing one week.
  /// Uses exactly 7 days.
  static const Duration week = Duration(days: DateTime.daysPerWeek);

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
