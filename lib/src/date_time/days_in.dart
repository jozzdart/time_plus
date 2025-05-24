import 'leap_year.dart';

/// Extension on [DateTime] to provide calendar-related utilities.
extension DateTimeIn on DateTime {
  /// Returns the number of days in the month of this [DateTime] instance.
  ///
  /// Handles leap years for February.
  ///
  /// Example:
  /// ```dart
  /// DateTime(2024, 2, 10).daysInMonth; // 29
  /// DateTime(2023, 2, 10).daysInMonth; // 28
  /// ```
  int get daysInMonth {
    // Precomputed for clarity and immutability
    const commonYearDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    const leapYearDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

    return isLeapYear ? leapYearDays[month - 1] : commonYearDays[month - 1];
  }

  /// Returns the number of days in the year of this [DateTime] instance.
  ///
  /// Handles leap years.
  ///
  /// Example:
  /// ```dart
  /// DateTime(2024, 1, 1).daysInYear; // 366
  /// DateTime(2023, 1, 1).daysInYear; // 365
  /// ```
  int get daysInYear {
    return isLeapYear ? 366 : 365;
  }
}
