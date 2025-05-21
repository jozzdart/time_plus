import '../core/consts.dart';

extension DurationInGettersExtensions on Duration {
  /// The number of entire weeks in this duration (7 days per week).
  int get fullWeeks => inDays ~/ TimePlusConsts.daysInWeek;

  /// The number of entire months in this duration (approx. 30 days per month).
  int get fullMonths => inDays ~/ TimePlusConsts.daysInMonth;

  /// The number of entire years in this duration (approx. 365 days per year).
  int get fullYears => inDays ~/ TimePlusConsts.daysInYear;

  /// The number of entire decades in this duration.
  int get fullDecades => inDays ~/ TimePlusConsts.daysInDecade;

  /// The number of entire centuries in this duration.
  int get fullCenturies => inDays ~/ TimePlusConsts.daysInCentury;

  /// The number of weeks in this duration.
  double get asWeeks => inDays / TimePlusConsts.daysInWeek;

  /// The number of months in this duration.
  double get asMonths => inDays / TimePlusConsts.daysInMonth;

  /// The number of years in this duration.
  double get asYears => inDays / TimePlusConsts.daysInYear;

  /// The number of decades in this duration.
  double get asDecades => inDays / TimePlusConsts.daysInDecade;

  /// The number of centuries in this duration.
  double get asCenturies => inDays / TimePlusConsts.daysInCentury;
}
