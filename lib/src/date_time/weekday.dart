import 'add/durations.dart';
import 'boundaries.dart';

/// An extension on the [DateTime] class to provide additional functionality
/// for working with weekdays.
extension DateTimeWeekdayExtensions on DateTime {
  /// Returns a [DateTime] object representing the start of the day
  /// for the previous day (yesterday).
  ///
  /// This is calculated by subtracting one day from the current date
  /// and then setting the time to the start of that day.
  DateTime get yesterday {
    return addDays(-1).startOfDay;
  }

  /// Returns a [DateTime] object representing the start of the day
  /// for the next day (tomorrow).
  ///
  /// This is calculated by adding one day to the current date
  /// and then setting the time to the start of that day.
  DateTime get tomorrow {
    return addDay.startOfDay;
  }

  /// Returns the weekday number for the next day (tomorrow).
  ///
  /// The weekday is represented as an integer where Monday is 1 and
  /// Sunday is 7, following the [DateTime] weekday convention.
  int get nextWeekday {
    return tomorrow.weekday;
  }

  /// Returns the weekday number for the previous day (yesterday).
  ///
  /// The weekday is represented as an integer where Monday is 1 and
  /// Sunday is 7, following the [DateTime] weekday convention.
  int get previousWeekday {
    return yesterday.weekday;
  }
}
