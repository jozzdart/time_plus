import '../consts.dart';

extension DurationAsGettersExtensions on Duration {
  /// Returns the duration as a fractional number of days.
  ///
  /// This method calculates the total duration in microseconds and divides it by
  /// the number of microseconds in a day. Unlike `inDays`, it returns a `double`
  /// that includes the fractional part of the day.
  double get asDays => inMicroseconds / Duration.microsecondsPerDay;

  /// Returns the duration as a fractional number of hours.
  ///
  /// This method calculates the total duration in microseconds and divides it by
  /// the number of microseconds in an hour. Unlike `inHours`, it returns a `double`
  /// that includes the fractional part of the hour.
  double get asHours => inMicroseconds / Duration.microsecondsPerHour;

  /// Returns the duration as a fractional number of minutes.
  ///
  /// This method calculates the total duration in microseconds and divides it by
  /// the number of microseconds in a minute. Unlike `inMinutes`, it returns a `double`
  /// that includes the fractional part of the minute.
  double get asMinutes => inMicroseconds / Duration.microsecondsPerMinute;

  /// Returns the duration as a fractional number of seconds.
  ///
  /// This method calculates the total duration in microseconds and divides it by
  /// the number of microseconds in a second. Unlike `inSeconds`, it returns a `double`
  /// that includes the fractional part of the second.
  double get asSeconds => inMicroseconds / Duration.microsecondsPerSecond;

  /// Returns the duration as a fractional number of milliseconds.
  ///
  /// This method calculates the total duration in microseconds and divides it by
  /// the number of microseconds in a millisecond, returning a `double`.
  double get asMilliseconds =>
      inMicroseconds / Duration.microsecondsPerMillisecond;

  /// Returns the duration as a fractional number of weeks.
  ///
  /// This method calculates the total duration in microseconds and divides it by
  /// the number of microseconds in a week. Unlike `inWeeks`, it returns a `double`
  /// that includes the fractional part of the week.
  double get asWeeks => inMicroseconds / TimePlusConsts.microsecondsPerWeek;

  /// Returns the duration as a fractional number of months.
  ///
  /// This method calculates the total duration in microseconds and divides it by
  /// the number of microseconds in a month. Unlike `inMonths`, it returns a `double`
  /// that includes the fractional part of the month.
  double get asMonths => asDays / TimePlusConsts.averageDaysPerMonth;

  /// Returns the duration as a fractional number of years.
  ///
  /// This method calculates the total duration in microseconds and divides it by
  /// the number of microseconds in a year. Unlike `inYears`, it returns a `double`
  /// that includes the fractional part of the year.
  double get asYears => asDays / TimePlusConsts.averageDaysPerYear;

  /// Returns the duration as a fractional number of decades.
  ///
  /// This method calculates the total duration in microseconds and divides it by
  /// the number of microseconds in a decade. Unlike `inDecades`, it returns a `double`
  /// that includes the fractional part of the decade.
  double get asDecades => asDays / TimePlusConsts.averageDaysPerDecade;

  /// Returns the duration as a fractional number of centuries.
  ///
  /// This method calculates the total duration in microseconds and divides it by
  /// the number of microseconds in a century. Unlike `inCenturies`, it returns a `double`
  /// that includes the fractional part of the century.
  double get asCenturies => asDays / TimePlusConsts.averageDaysPerCentury;
}
