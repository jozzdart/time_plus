import '../from.dart';

extension IntDurationExtension on int {
  /// Returns a [Duration] object representing the number of milliseconds.
  Duration get milliseconds => Duration(milliseconds: this);

  /// Returns a [Duration] object representing the number of seconds.
  Duration get seconds => Duration(seconds: this);

  /// Returns a [Duration] object representing the number of minutes.
  Duration get minutes => Duration(minutes: this);

  /// Returns a [Duration] object representing the number of hours.
  Duration get hours => Duration(hours: this);

  /// Returns a [Duration] object representing the number of days.
  Duration get days => Duration(days: this);

  /// Returns a [Duration] object representing the number of weeks.
  Duration get weeks => DurationFrom.weeks(this);

  /// Returns a [Duration] object representing the number of months.
  Duration get months => DurationFrom.months(this);

  /// Returns a [Duration] object representing the number of years.
  Duration get years => DurationFrom.years(this);

  /// Returns a [Duration] object representing the number of decades.
  Duration get decades => DurationFrom.decades(this);

  /// Returns a [Duration] object representing the number of centuries.
  Duration get centuries => DurationFrom.centuries(this);
}
