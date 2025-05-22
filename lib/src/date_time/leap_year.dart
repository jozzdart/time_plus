/// An extension on the `DateTime` class to provide methods for determining
/// leap year, leap month, and leap day status.
extension DateTimeLeapYearExtensions on DateTime {
  /// Determines if the current year is a leap year.
  ///
  /// A year is considered a leap year if it is divisible by 4, except for end-of-century
  /// years which must be divisible by 400. This means that the year 2000 was a leap year,
  /// although 1900 was not.
  ///
  /// Returns `true` if the year is a leap year, otherwise `false`.
  bool get isLeapYear {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }

  /// Determines if the current month is a leap month.
  ///
  /// A month is considered a leap month if it is February (month 2) in a leap year.
  ///
  /// Returns `true` if the month is February in a leap year, otherwise `false`.
  bool get isLeapMonth {
    return isLeapYear && month == 2;
  }

  /// Determines if the current day is a leap day.
  ///
  /// A day is considered a leap day if it is the 29th of February in a leap year.
  ///
  /// Returns `true` if the day is February 29th in a leap year, otherwise `false`.
  bool get isLeapDay {
    return isLeapMonth && day == 29;
  }
}
