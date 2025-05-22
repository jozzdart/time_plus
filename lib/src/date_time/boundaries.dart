import '../consts.dart';

extension DateTimeBoundariesExtensions on DateTime {
  /// Returns a [DateTime] representing the start of the current millisecond.
  ///
  /// The returned [DateTime] has the same year, month, day, hour, minute, second, and millisecond
  /// as the original, but with microseconds set to zero.
  DateTime get startOfMillisecond {
    return _withSameZone(year, month, day, hour, minute, second, millisecond);
  }

  /// Returns a [DateTime] representing the end of the current millisecond.
  ///
  /// The returned [DateTime] has the same year, month, day, hour, minute, second, and millisecond
  /// as the original, but with microseconds set to zero.
  DateTime get endOfMillisecond {
    return _withSameZone(
        year, month, day, hour, minute, second, millisecond + 1);
  }

  /// Returns a [DateTime] representing the start of the current second.
  ///
  /// The returned [DateTime] has the same year, month, day, hour, minute, and second
  /// as the original, but with milliseconds and microseconds set to zero.
  DateTime get startOfSecond {
    return _withSameZone(year, month, day, hour, minute, second);
  }

  /// Returns a [DateTime] representing the end of the current second.
  ///
  /// The returned [DateTime] has the same year, month, day, hour, minute, and second
  /// as the original, but with milliseconds and microseconds set to zero.
  DateTime get endOfSecond {
    return _withSameZone(year, month, day, hour, minute, second + 1);
  }

  /// Returns a [DateTime] representing the start of the current minute.
  ///
  /// The returned [DateTime] has the same year, month, day, hour, and minute
  /// as the original, but with seconds, milliseconds, and microseconds set to zero.
  DateTime get startOfMinute {
    return _withSameZone(year, month, day, hour, minute);
  }

  /// Returns a [DateTime] representing the end of the current minute.
  ///
  /// The returned [DateTime] has the same year, month, day, and hour as the original,
  /// but the minute is incremented by one, with seconds, milliseconds, and microseconds set to zero.
  DateTime get endOfMinute {
    return _withSameZone(year, month, day, hour, minute + 1);
  }

  /// Returns a [DateTime] representing the start of the current hour.
  ///
  /// The returned [DateTime] has the same year, month, day, and hour as the original,
  /// but with minutes, seconds, milliseconds, and microseconds set to zero.
  DateTime get startOfHour {
    return _withSameZone(year, month, day, hour);
  }

  /// Returns a [DateTime] representing the end of the current hour.
  ///
  /// The returned [DateTime] has the same year, month, and day as the original,
  /// but the hour is incremented by one, with minutes, seconds, milliseconds, and microseconds set to zero.
  DateTime get endOfHour {
    return _withSameZone(year, month, day, hour + 1);
  }

  /// Returns a [DateTime] representing the start of the current day.
  ///
  /// The returned [DateTime] has the same year, month, and day as the original,
  /// but with hours, minutes, seconds, milliseconds, and microseconds set to zero.
  DateTime get startOfDay {
    return _withSameZone(year, month, day);
  }

  /// Returns a [DateTime] representing the end of the current day.
  ///
  /// The returned [DateTime] has the same year and month as the original,
  /// but the day is incremented by one, with hours, minutes, seconds, milliseconds, and microseconds set to zero.
  DateTime get endOfDay {
    return _withSameZone(year, month, day + 1);
  }

  /// Returns a [DateTime] representing the start of the current week.
  ///
  /// The week starts on Monday. If the calculated Monday is January 1st,
  /// it is adjusted to the previous year's last week.
  DateTime get startOfWeek {
    final monday =
        _withSameZone(year, month, day).subtract(Duration(days: weekday - 1));

    if (month == 1 && monday.month == 1 && monday.day == 1) {
      return monday.subtract(const Duration(days: 7));
    }

    return monday;
  }

  /// Returns a [DateTime] representing the end of the current week.
  ///
  /// The week ends on the Sunday following the start of the week.
  DateTime get endOfWeek {
    return startOfWeek.add(const Duration(days: 7));
  }

  /// Returns a [DateTime] representing the start of the current month.
  ///
  /// The returned [DateTime] has the same year and month as the original,
  /// but the day is set to the first, with hours, minutes, seconds, milliseconds, and microseconds set to zero.
  DateTime get startOfMonth {
    return _withSameZone(year, month, 1);
  }

  /// Returns a [DateTime] representing the end of the current month.
  ///
  /// The returned [DateTime] has the same year as the original,
  /// but the month is incremented by one, with the day set to the first,
  /// and hours, minutes, seconds, milliseconds, and microseconds set to zero.
  DateTime get endOfMonth {
    return _withSameZone(year, month + 1, 1);
  }

  /// Returns a [DateTime] representing the start of the current year.
  ///
  /// The returned [DateTime] has the same year as the original,
  /// but the month and day are set to January 1st, with hours, minutes, seconds, milliseconds, and microseconds set to zero.
  DateTime get startOfYear {
    return _withSameZone(year, 1, 1);
  }

  /// Returns a [DateTime] representing the end of the current year.
  ///
  /// The returned [DateTime] has the year incremented by one,
  /// with the month and day set to January 1st, and hours, minutes, seconds, milliseconds, and microseconds set to zero.
  DateTime get endOfYear {
    return _withSameZone(year + 1, 1, 1);
  }

  /// Returns a [DateTime] representing the start of the current decade.
  ///
  /// The returned [DateTime] has the same year as the original,
  /// but the month and day are set to January 1st, with hours, minutes, seconds, milliseconds, and microseconds set to zero.
  DateTime get startOfDecade {
    return _withSameZone(year - year % TimePlusConsts.yearsInDecade, 1, 1);
  }

  /// Returns a [DateTime] representing the end of the current decade.
  ///
  /// The returned [DateTime] has the year incremented by ten,
  /// with the month and day set to January 1st, and hours, minutes, seconds, milliseconds, and microseconds set to zero.
  DateTime get endOfDecade {
    return _withSameZone(
        year -
            year % TimePlusConsts.yearsInDecade +
            TimePlusConsts.yearsInDecade,
        1,
        1);
  }

  /// Returns a [DateTime] representing the start of the current century.
  ///
  /// The returned [DateTime] has the same year as the original,
  /// but the month and day are set to January 1st, with hours, minutes, seconds, milliseconds, and microseconds set to zero.
  DateTime get startOfCentury {
    return _withSameZone(year - year % TimePlusConsts.yearsInCentury, 1, 1);
  }

  /// Returns a [DateTime] representing the end of the current century.
  ///
  /// The returned [DateTime] has the year incremented by one hundred,
  /// with the month and day set to January 1st, and hours, minutes, seconds, milliseconds, and microseconds set to zero.
  DateTime get endOfCentury {
    return _withSameZone(
        year -
            year % TimePlusConsts.yearsInCentury +
            TimePlusConsts.yearsInCentury,
        1,
        1);
  }

  /// Creates a [DateTime] object with the same time zone as the original.
  ///
  /// The [year], [month], [day], [hour], [minute], [second], [millisecond], and [microsecond]
  /// parameters are used to construct the new [DateTime] object. If the original [DateTime] is in UTC,
  /// the new [DateTime] will also be in UTC.
  DateTime _withSameZone(int year,
      [int month = 1,
      int day = 1,
      int hour = 0,
      int minute = 0,
      int second = 0,
      int millisecond = 0,
      int microsecond = 0]) {
    return isUtc
        ? DateTime.utc(
            year, month, day, hour, minute, second, millisecond, microsecond)
        : DateTime(
            year, month, day, hour, minute, second, millisecond, microsecond);
  }
}
