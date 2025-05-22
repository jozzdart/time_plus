import '../consts.dart';

extension DurationInGettersExtensions on Duration {
  /// The number of entire weeks in this duration (7 days per week).
  int get inWeeks => inDays ~/ TimePlusConsts.daysInWeek;

  /// The number of entire months in this duration (approx. 30 days per month).
  int get inMonths => inDays ~/ TimePlusConsts.daysInMonth;

  /// The number of entire years in this duration (approx. 365 days per year).
  int get inYears => inDays ~/ TimePlusConsts.daysInYear;

  /// The number of entire decades in this duration.
  int get inDecades => inDays ~/ TimePlusConsts.daysInDecade;

  /// The number of entire centuries in this duration.
  int get inCenturies => inDays ~/ TimePlusConsts.daysInCentury;
}
