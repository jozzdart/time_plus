/// A lightweight extension library for working with time in Dart.
///
/// `time_plus` enhances the built-in [DateTime] and [Duration] classes
/// by providing intuitive and powerful utilities for time manipulation.
///
/// Features include:
/// - Adding time units like weeks, months, years, decades, and centuries
/// - Extracting partial units from durations (e.g., only hours, only minutes)
/// - Converting durations to larger time units
/// - Removing whole units to isolate remaining time
///
/// Designed with simplicity and clarity in mind.
/// No dependencies. Just useful time extensions.
library;

export 'duration/add.dart';
export 'duration/from.dart';
export 'duration/in.dart';
export 'duration/only.dart';
export 'duration/without.dart';
export 'date_time/add/durations.dart';
export 'date_time/add/extending_years.dart';
export 'date_time/add/month_and_year.dart';
export 'date_time/leap_year.dart';
export 'date_time/boundaries.dart';
export 'date_time/is_same.dart';
export 'date_time/weekday.dart';
export 'core/consts.dart';
