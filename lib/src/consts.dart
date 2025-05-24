class TimePlusConsts {
  // -------- Shared constants ---------------------------

  /// The number of days in a week.
  @Deprecated('Use DateTime.daysPerWeek instead')
  static const int daysInWeek = DateTime.daysPerWeek;

  /// The number of years in a decade.
  static const int yearsInDecade = 10;

  /// The number of years in a century.
  static const int yearsInCentury = 100;

  /// The number of decades in a century.
  static const int decadesInCentury = 10;

  // -------- DateTime constants ---------------------------

  /// The number of months in a year.
  static const int monthsInYear = 12;

  // -------- Duration constants ---------------------------

  /// The average number of days in a Gregorian calendar month over a long-term period.
  ///
  /// This value is derived from the 400-year cycle of the Gregorian calendar, which includes
  /// both common years (365 days) and leap years (366 days). In 400 years, there are exactly
  /// 146,097 days and 4,800 months:
  ///
  /// ```
  /// 146,097 days ÷ 4,800 months = 30.436875 days/month
  /// ```
  ///
  /// This constant is useful for approximations, simulations, and scenarios where
  /// precision across long time spans is required, but it does **not** represent the
  /// exact number of days in any individual month (e.g., February has 28 or 29 days).
  static const double averageDaysPerMonth = 30.436875;

  /// The average number of days in a Gregorian calendar year over a long time span.
  ///
  /// This value reflects the mean length of a year in the Gregorian calendar, accounting
  /// for leap year rules across a 400-year cycle:
  ///
  /// - Most years have 365 days.
  /// - Every 4th year is a leap year with 366 days.
  /// - Except years divisible by 100, which are not leap years,
  /// - Unless divisible by 400, which are leap years.
  ///
  /// Over 400 years, this results in exactly 146,097 days:
  ///
  /// ```
  /// 146,097 days ÷ 400 years = 365.2425 days/year
  /// ```
  ///
  /// This constant is widely used in astronomy, calendar systems, and timekeeping
  /// to approximate the solar year. It does **not** represent any single year’s actual
  /// day count, but rather a long-term average.
  static const double averageDaysPerYear = 365.2425;

  /// The average number of days in a Gregorian calendar decade.
  ///
  /// This is computed as:
  /// ```
  /// averageDaysPerYear × yearsInDecade = 365.2425 × 10 = 3,652.425
  /// ```
  /// It represents the approximate number of days in 10 years, using the long-term
  /// average of 365.2425 days per year based on the Gregorian calendar system.
  ///
  /// Useful for calculations involving long-term durations, forecasting, and date
  /// simulations over multi-year spans.
  static const double averageDaysPerDecade =
      averageDaysPerYear * TimePlusConsts.yearsInDecade;

  /// The average number of days in a Gregorian calendar century.
  ///
  /// This is computed as:
  /// ```
  /// daysInDecade × decadesInCentury = 3,652.425 × 10 = 36,524.25
  /// ```
  /// It reflects the mean number of days across 100 years, factoring in leap years
  /// over multiple Gregorian cycles. While actual century lengths vary slightly depending
  /// on leap year occurrences (e.g. years divisible by 100 but not 400), this value
  /// provides a stable long-term average for time-based calculations.
  ///
  /// Recommended for simulations, estimations, and conversions between time units over
  /// extended durations.
  static const double averageDaysPerCentury =
      averageDaysPerDecade * TimePlusConsts.decadesInCentury;

  /// Approximate number of days in a single month (used for quick, non-precise calculations).
  static const int roundedDaysPerMonth = 30;

  /// Approximate number of days in a single year (used for quick, non-precise calculations).
  static const int roundedDaysPerYear = 365;

  /// Approximate number of days in a single decade (used for quick, non-precise calculations).
  static const int roundedDaysInDecade = 3652;

  /// Approximate number of days in a single century (used for quick, non-precise calculations).
  static const int roundedDaysInCentury = 36524;

  /// The number of microseconds in a week.
  static const int microsecondsPerWeek =
      Duration.microsecondsPerDay * DateTime.daysPerWeek;

  /// The number of milliseconds in a month.
  static const int millisecondsPerMonth = 2629746000;

  /// The number of milliseconds in a year.
  static const int millisecondsPerYear = 31556952000;

  /// The number of milliseconds in a decade.
  static const int millisecondsPerDecade = millisecondsPerYear * yearsInDecade;

  /// The number of microseconds in a century.
  static const int millisecondsPerCentury =
      millisecondsPerDecade * decadesInCentury;
}
