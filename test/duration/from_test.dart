import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DurationFrom static methods', () {
    test('microseconds', () {
      expect(DurationFrom.microseconds(123), Duration(microseconds: 123));
    });

    test('milliseconds', () {
      expect(DurationFrom.milliseconds(123), Duration(milliseconds: 123));
    });

    test('seconds', () {
      expect(DurationFrom.seconds(123), Duration(seconds: 123));
    });

    test('minutes', () {
      expect(DurationFrom.minutes(123), Duration(minutes: 123));
    });

    test('hours', () {
      expect(DurationFrom.hours(123), Duration(hours: 123));
    });

    test('days', () {
      expect(DurationFrom.days(123), Duration(days: 123));
    });

    test('weeks', () {
      expect(DurationFrom.weeks(2),
          Duration(days: 2 * TimePlusDurationConsts.daysInWeek));
    });

    test('months', () {
      expect(DurationFrom.months(3),
          Duration(days: 3 * TimePlusDurationConsts.daysInMonth));
    });

    test('years', () {
      expect(DurationFrom.years(4),
          Duration(days: 4 * TimePlusDurationConsts.daysInYear));
    });

    test('decades', () {
      expect(DurationFrom.decades(1),
          Duration(days: TimePlusDurationConsts.daysInDecade));
    });

    test('centuries', () {
      expect(DurationFrom.centuries(2),
          Duration(days: 2 * TimePlusDurationConsts.daysInCentury));
    });
  });

  group('DurationFrom static constants', () {
    test('microsecond', () {
      expect(DurationFrom.microsecond, Duration(microseconds: 1));
    });

    test('millisecond', () {
      expect(DurationFrom.millisecond, Duration(milliseconds: 1));
    });

    test('second', () {
      expect(DurationFrom.second, Duration(seconds: 1));
    });

    test('minute', () {
      expect(DurationFrom.minute, Duration(minutes: 1));
    });

    test('hour', () {
      expect(DurationFrom.hour, Duration(hours: 1));
    });

    test('day', () {
      expect(DurationFrom.day, Duration(days: 1));
    });

    test('week', () {
      expect(
          DurationFrom.week, Duration(days: TimePlusDurationConsts.daysInWeek));
    });

    test('month', () {
      expect(DurationFrom.month,
          Duration(days: TimePlusDurationConsts.daysInMonth));
    });

    test('year', () {
      expect(
          DurationFrom.year, Duration(days: TimePlusDurationConsts.daysInYear));
    });

    test('decade', () {
      expect(DurationFrom.decade,
          Duration(days: TimePlusDurationConsts.daysInDecade));
    });

    test('century', () {
      expect(DurationFrom.century,
          Duration(days: TimePlusDurationConsts.daysInCentury));
    });
  });

  group('DurationFrom edge case and consistency tests', () {
    test('negative values', () {
      expect(DurationFrom.years(-2),
          Duration(days: -2 * TimePlusDurationConsts.daysInYear));
      expect(DurationFrom.centuries(-1), -DurationFrom.century);
    });

    test('zero values', () {
      expect(DurationFrom.seconds(0), Duration.zero);
      expect(DurationFrom.years(0), Duration.zero);
    });

    test('composability', () {
      final total = DurationFrom.week +
          DurationFrom.day +
          DurationFrom.hour +
          DurationFrom.minute +
          DurationFrom.second;

      final expected = Duration(
        days: TimePlusDurationConsts.daysInWeek + 1,
        hours: 1,
        minutes: 1,
        seconds: 1,
      );

      expect(total, expected);
    });

    test('manual consistency check with days', () {
      final threeMonths = DurationFrom.months(3);
      expect(threeMonths.inDays, 3 * TimePlusDurationConsts.daysInMonth);
    });

    test('large values', () {
      expect(DurationFrom.centuries(1000).inDays,
          1000 * TimePlusDurationConsts.daysInCentury);
      expect(DurationFrom.years(10000).inDays,
          10000 * TimePlusDurationConsts.daysInYear);
    });

    test('very small values', () {
      expect(DurationFrom.microseconds(1), Duration(microseconds: 1));
      expect(DurationFrom.milliseconds(1), Duration(milliseconds: 1));
      expect(DurationFrom.seconds(1), Duration(seconds: 1));
    });

    test('complex duration combinations', () {
      final complex = DurationFrom.century +
          DurationFrom.decade +
          DurationFrom.year +
          DurationFrom.month +
          DurationFrom.week +
          DurationFrom.day +
          DurationFrom.hour +
          DurationFrom.minute +
          DurationFrom.second +
          DurationFrom.millisecond;

      final expected = Duration(
        days: TimePlusDurationConsts.daysInCentury +
            TimePlusDurationConsts.daysInDecade +
            TimePlusDurationConsts.daysInYear +
            TimePlusDurationConsts.daysInMonth +
            TimePlusDurationConsts.daysInWeek +
            1,
        hours: 1,
        minutes: 1,
        seconds: 1,
        milliseconds: 1,
      );

      expect(complex, expected);
    });

    test('mixed positive and negative values', () {
      final mixed = DurationFrom.century +
          DurationFrom.decade -
          DurationFrom.year +
          DurationFrom.month -
          DurationFrom.week;

      final expected = Duration(
        days: TimePlusDurationConsts.daysInCentury +
            TimePlusDurationConsts.daysInDecade -
            TimePlusDurationConsts.daysInYear +
            TimePlusDurationConsts.daysInMonth -
            TimePlusDurationConsts.daysInWeek,
      );

      expect(mixed, expected);
    });
  });
}
