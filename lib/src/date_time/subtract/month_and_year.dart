import '../utc_flag.dart';
import '../../consts.dart';

/// Extension on [DateTime] to subtract months and years, with proper handling of month overflow and leap years.
extension DateTimeSubtractMonthsAndYearsExtension on DateTime {
  /// Returns a new [DateTime] with the specified number of [months] subtracted.
  ///
  /// The day of the month is clamped to the last valid day of the resulting month.
  /// For example, subtracting 1 month from March 31 will result in February 28 (or 29 in a leap year).
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2023, 3, 31);
  /// DateTime past = now.subtractMonths(1); // February 28 or 29
  /// ```
  DateTime subtractMonths(int months) {
    final totalMonths =
        year * TimePlusConsts.monthsInYear + (month - 1) - months;
    final newYear = totalMonths ~/ TimePlusConsts.monthsInYear;
    final newMonth = (totalMonths % TimePlusConsts.monthsInYear) + 1;

    return _createDateTimeWithClampedDay(newYear, newMonth);
  }

  /// Returns a new [DateTime] with the specified number of [years] subtracted.
  ///
  /// The day of the month is clamped to the last valid day of the resulting month.
  /// For example, subtracting 1 year from February 29 will result in February 28 if the resulting year is not a leap year.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2021, 2, 28);
  /// DateTime past = now.subtractYears(1); // February 28, 2020
  /// ```
  DateTime subtractYears(int years) {
    final newYear = year - years;
    final newMonth = month;

    return _createDateTimeWithClampedDay(newYear, newMonth);
  }

  /// Shortcut to subtract exactly one month from the current [DateTime].
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2023, 3, 31);
  /// DateTime past = now.subtractMonth; // February 28 or 29
  /// ```
  DateTime get subtractMonth => subtractMonths(1);

  /// Shortcut to subtract exactly one year from the current [DateTime].
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2021, 2, 28);
  /// DateTime past = now.subtractYear; // February 28, 2020
  /// ```
  DateTime get subtractYear => subtractYears(1);

  /// Creates a new [DateTime] with the specified [newYear] and [newMonth],
  /// clamping the day to the last valid day of the month.
  ///
  /// This ensures that the resulting [DateTime] is always valid, even if the
  /// original day does not exist in the new month (e.g., February 30).
  DateTime _createDateTimeWithClampedDay(int newYear, int newMonth) {
    final lastDayOfMonth = DateTime(newYear, newMonth + 1, 0).day;
    final newDay = day.clamp(1, lastDayOfMonth);
    // preserve the original time-of-day and UTC/local flag:
    return copyWithSameUtcFlag(
      year: newYear,
      month: newMonth,
      day: newDay,
    );
  }
}
