import 'from.dart';

/// An extension on the [Duration] class to provide additional methods
/// for adding various time units to a [Duration] instance.
extension DurationAddTimeExtensions on Duration {
  /// Adds the specified [duration] to the current [Duration] instance.
  ///
  /// Returns a new [Duration] that is the sum of the current instance and
  /// the specified [duration].
  Duration add(Duration duration) {
    return this + duration;
  }

  /// Adds the specified number of [microseconds] to the current [Duration].
  ///
  /// Returns a new [Duration] with the added microseconds.
  Duration addMicroseconds(int microseconds) {
    return add(DurationFrom.microseconds(microseconds));
  }

  /// Adds the specified number of [milliseconds] to the current [Duration].
  ///
  /// Returns a new [Duration] with the added milliseconds.
  Duration addMilliseconds(int milliseconds) {
    return add(DurationFrom.milliseconds(milliseconds));
  }

  /// Adds the specified number of [seconds] to the current [Duration].
  ///
  /// Returns a new [Duration] with the added seconds.
  Duration addSeconds(int seconds) {
    return add(DurationFrom.seconds(seconds));
  }

  /// Adds the specified number of [minutes] to the current [Duration].
  ///
  /// Returns a new [Duration] with the added minutes.
  Duration addMinutes(int minutes) {
    return add(DurationFrom.minutes(minutes));
  }

  /// Adds the specified number of [hours] to the current [Duration].
  ///
  /// Returns a new [Duration] with the added hours.
  Duration addHours(int hours) {
    return add(DurationFrom.hours(hours));
  }

  /// Adds the specified number of [days] to the current [Duration].
  ///
  /// Returns a new [Duration] with the added days.
  Duration addDays(int days) {
    return add(DurationFrom.days(days));
  }

  /// Adds the specified number of [weeks] to the current [Duration].
  ///
  /// Returns a new [Duration] with the added weeks.
  Duration addWeeks(int weeks) {
    return add(DurationFrom.weeks(weeks));
  }

  /// Adds the specified number of [months] to the current [Duration].
  ///
  /// Returns a new [Duration] with the added months.
  Duration addMonths(int months) {
    return add(DurationFrom.months(months));
  }

  /// Adds the specified number of [years] to the current [Duration].
  ///
  /// Returns a new [Duration] with the added years.
  Duration addYears(int years) {
    return add(DurationFrom.years(years));
  }

  /// Adds the specified number of [decades] to the current [Duration].
  ///
  /// Returns a new [Duration] with the added decades.
  Duration addDecades(int decades) {
    return add(DurationFrom.decades(decades));
  }

  /// Adds the specified number of [centuries] to the current [Duration].
  ///
  /// Returns a new [Duration] with the added centuries.
  Duration addCenturies(int centuries) {
    return add(DurationFrom.centuries(centuries));
  }

  /// Adds one microsecond to the current [Duration].
  ///
  /// Returns a new [Duration] with one additional microsecond.
  Duration get addMicrosecond => addMicroseconds(1);

  /// Adds one millisecond to the current [Duration].
  ///
  /// Returns a new [Duration] with one additional millisecond.
  Duration get addMillisecond => addMilliseconds(1);

  /// Adds one second to the current [Duration].
  ///
  /// Returns a new [Duration] with one additional second.
  Duration get addSecond => addSeconds(1);

  /// Adds one minute to the current [Duration].
  ///
  /// Returns a new [Duration] with one additional minute.
  Duration get addMinute => addMinutes(1);

  /// Adds one hour to the current [Duration].
  ///
  /// Returns a new [Duration] with one additional hour.
  Duration get addHour => addHours(1);

  /// Adds one day to the current [Duration].
  ///
  /// Returns a new [Duration] with one additional day.
  Duration get addDay => addDays(1);

  /// Adds one week to the current [Duration].
  ///
  /// Returns a new [Duration] with one additional week.
  Duration get addWeek => addWeeks(1);

  /// Adds one month to the current [Duration].
  ///
  /// Returns a new [Duration] with one additional month.
  Duration get addMonth => addMonths(1);

  /// Adds one year to the current [Duration].
  ///
  /// Returns a new [Duration] with one additional year.
  Duration get addYear => addYears(1);

  /// Adds one decade to the current [Duration].
  ///
  /// Returns a new [Duration] with one additional decade.
  Duration get addDecade => addDecades(1);

  /// Adds one century to the current [Duration].
  ///
  /// Returns a new [Duration] with one additional century.
  Duration get addCentury => addCenturies(1);
}
