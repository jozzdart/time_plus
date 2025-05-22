import '../../consts.dart';

/// Extension on [DateTime] to add months and years, with proper handling of month overflow and leap years.
extension DateTimeAddMonthsAndYearsExtension on DateTime {
  /// Returns a new [DateTime] with the specified number of [months] added.
  ///
  /// The day of the month is clamped to the last valid day of the resulting month.
  /// For example, adding 1 month to January 31 will result in February 28 (or 29 in a leap year).
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2023, 1, 31);
  /// DateTime future = now.addMonths(1); // February 28 or 29
  /// ```
  DateTime addMonths(int months) {
    final totalMonths =
        year * TimePlusConsts.monthsInYear + (month - 1) + months;
    final newYear = totalMonths ~/ TimePlusConsts.monthsInYear;
    final newMonth = (totalMonths % TimePlusConsts.monthsInYear) + 1;

    return _createDateTimeWithClampedDay(newYear, newMonth);
  }

  /// Returns a new [DateTime] with the specified number of [years] added.
  ///
  /// The day of the month is clamped to the last valid day of the resulting month.
  /// For example, adding 1 year to February 29 will result in February 28 if the resulting year is not a leap year.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2020, 2, 29);
  /// DateTime future = now.addYears(1); // February 28, 2021
  /// ```
  DateTime addYears(int years) {
    final newYear = year + years;
    final newMonth = month;

    return _createDateTimeWithClampedDay(newYear, newMonth);
  }

  /// Shortcut to add exactly one month to the current [DateTime].
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2023, 1, 31);
  /// DateTime future = now.addMonth; // February 28 or 29
  /// ```
  DateTime get addMonth => addMonths(1);

  /// Shortcut to add exactly one year to the current [DateTime].
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2020, 2, 29);
  /// DateTime future = now.addYear; // February 28, 2021
  /// ```
  DateTime get addYear => addYears(1);

  /// Creates a new [DateTime] with the specified [newYear] and [newMonth],
  /// clamping the day to the last valid day of the month.
  ///
  /// This ensures that the resulting [DateTime] is always valid, even if the
  /// original day does not exist in the new month (e.g., February 30).
  DateTime _createDateTimeWithClampedDay(int newYear, int newMonth) {
    final lastDayOfMonth = DateTime(newYear, newMonth + 1, 0).day;
    final newDay = day.clamp(1, lastDayOfMonth);
    return DateTime(newYear, newMonth, newDay);
  }
}
