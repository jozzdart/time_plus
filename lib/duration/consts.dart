/// A class containing constant values related to time durations.
class TimePlusDurationConsts {
  /// The number of days in a week.
  static const int daysInWeek = 7;

  /// The approximate number of days in a month.
  /// Note: This is an average value and may not reflect the actual number of days in specific months.
  static const int daysInMonth = 30;

  /// The number of days in a non-leap year.
  static const int daysInYear = 365;

  /// The number of days in a decade, calculated as the number of days in a year multiplied by the number of years in a decade.
  static const int daysInDecade = daysInYear * yearsInDecade;

  /// The number of days in a century, calculated as the number of days in a decade multiplied by the number of decades in a century.
  static const int daysInCentury = daysInDecade * decadesInCentury;

  /// The number of years in a decade.
  static const int yearsInDecade = 10;

  /// The number of years in a century.
  static const int yearsInCentury = 100;

  /// The number of decades in a century.
  static const int decadesInCentury = 10;
}
