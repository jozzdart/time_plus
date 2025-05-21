import 'consts.dart';

extension DurationInGettersExtensions on Duration {
  /// The number of entire weeks in this duration (7 days per week).
  int get fullWeeks => inDays ~/ TimePlusDurationConsts.daysInWeek;

  /// The number of entire months in this duration (approx. 30 days per month).
  int get fullMonths => inDays ~/ TimePlusDurationConsts.daysInMonth;

  /// The number of entire years in this duration (approx. 365 days per year).
  int get fullYears => inDays ~/ TimePlusDurationConsts.daysInYear;

  /// The number of entire decades in this duration.
  int get fullDecades => inDays ~/ TimePlusDurationConsts.daysInDecade;

  /// The number of entire centuries in this duration.
  int get fullCenturies => inDays ~/ TimePlusDurationConsts.daysInCentury;

  /// The number of weeks in this duration.
  double get asWeeks => inDays / TimePlusDurationConsts.daysInWeek;

  /// The number of months in this duration.
  double get asMonths => inDays / TimePlusDurationConsts.daysInMonth;

  /// The number of years in this duration.
  double get asYears => inDays / TimePlusDurationConsts.daysInYear;

  /// The number of decades in this duration.
  double get asDecades => inDays / TimePlusDurationConsts.daysInDecade;

  /// The number of centuries in this duration.
  double get asCenturies => inDays / TimePlusDurationConsts.daysInCentury;
}
