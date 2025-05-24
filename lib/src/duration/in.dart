import '../consts.dart';
import 'as.dart';

extension DurationInGettersExtensions on Duration {
  /// The number of entire weeks in this duration (7 days per week).
  int get inWeeks => inDays ~/ DateTime.daysPerWeek;

  /// The number of entire months in this duration (based on average month length of ~30.436875 days).
  int get inMonths => (asDays / TimePlusConsts.averageDaysPerMonth).floor();

  /// The number of entire years in this duration (based on average year length of ~365.2425 days).
  int get inYears => (asDays / TimePlusConsts.averageDaysPerYear).floor();

  /// The number of entire decades in this duration (based on average decade length of ~3652.425 days).
  int get inDecades => (asDays / TimePlusConsts.averageDaysPerDecade).floor();

  /// The number of entire centuries in this duration (based on average century length of ~36524.25 days).
  int get inCenturies =>
      (asDays / TimePlusConsts.averageDaysPerCentury).floor();
}
