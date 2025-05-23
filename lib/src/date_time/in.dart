import 'leap_year.dart';

/// Extension on [DateTime] to provide calendar-related utilities.
extension DateTimeIn on DateTime {
  /// Returns the number of days in the month of this [DateTime] instance.
  ///
  /// Handles leap years for February. Safe for all values where [month] is 1–12.
  ///
  /// Example:
  /// ```dart
  /// DateTime(2024, 2, 10).daysInMonth; // 29
  /// DateTime(2023, 2, 10).daysInMonth; // 28
  /// ```
  int get daysInMonth {
    assert(month >= 1 && month <= 12, 'Month must be between 1 and 12');

    // Precomputed for clarity and immutability
    const commonYearDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    const leapYearDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    return isLeapYear ? leapYearDays[month - 1] : commonYearDays[month - 1];
  }
}
