import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DurationInGettersExtensions', () {
    group('fullWeeks', () {
      test('returns correct number of full weeks', () {
        expect(const Duration(days: 7).fullWeeks, equals(1));
        expect(const Duration(days: 14).fullWeeks, equals(2));
        expect(const Duration(days: 6).fullWeeks, equals(0));
        expect(const Duration(days: 20).fullWeeks, equals(2));
      });
    });

    group('fullMonths', () {
      test('returns correct number of full months', () {
        expect(const Duration(days: 30).fullMonths, equals(1));
        expect(const Duration(days: 60).fullMonths, equals(2));
        expect(const Duration(days: 29).fullMonths, equals(0));
        expect(const Duration(days: 90).fullMonths, equals(3));
      });
    });

    group('fullYears', () {
      test('returns correct number of full years', () {
        expect(const Duration(days: 365).fullYears, equals(1));
        expect(const Duration(days: 730).fullYears, equals(2));
        expect(const Duration(days: 364).fullYears, equals(0));
        expect(const Duration(days: 1095).fullYears, equals(3));
      });
    });

    group('fullDecades', () {
      test('returns correct number of full decades', () {
        expect(const Duration(days: 3650).fullDecades, equals(1));
        expect(const Duration(days: 7300).fullDecades, equals(2));
        expect(const Duration(days: 3649).fullDecades, equals(0));
        expect(const Duration(days: 10950).fullDecades, equals(3));
      });
    });

    group('fullCenturies', () {
      test('returns correct number of full centuries', () {
        expect(const Duration(days: 36500).fullCenturies, equals(1));
        expect(const Duration(days: 73000).fullCenturies, equals(2));
        expect(const Duration(days: 36499).fullCenturies, equals(0));
        expect(const Duration(days: 109500).fullCenturies, equals(3));
      });
    });

    group('asWeeks', () {
      test('returns correct number of weeks as double', () {
        expect(const Duration(days: 7).asWeeks, equals(1.0));
        expect(const Duration(days: 14).asWeeks, equals(2.0));
        expect(const Duration(days: 3).asWeeks,
            equals(3 / TimePlusConsts.daysInWeek));
        expect(const Duration(days: 10).asWeeks,
            equals(10 / TimePlusConsts.daysInWeek));
      });
    });

    group('asMonths', () {
      test('returns correct number of months as double', () {
        expect(const Duration(days: 30).asMonths, equals(1.0));
        expect(const Duration(days: 60).asMonths, equals(2.0));
        expect(const Duration(days: 15).asMonths,
            equals(15 / TimePlusConsts.daysInMonth));
        expect(const Duration(days: 45).asMonths,
            equals(45 / TimePlusConsts.daysInMonth));
      });
    });

    group('asYears', () {
      test('returns correct number of years as double', () {
        expect(const Duration(days: 365).asYears, equals(1.0));
        expect(const Duration(days: 730).asYears, equals(2.0));
        expect(const Duration(days: 182).asYears,
            equals(182 / TimePlusConsts.daysInYear));
        expect(const Duration(days: 547).asYears,
            equals(547 / TimePlusConsts.daysInYear));
      });
    });

    group('asDecades', () {
      test('returns correct number of decades as double', () {
        expect(const Duration(days: 3650).asDecades, equals(1.0));
        expect(const Duration(days: 7300).asDecades, equals(2.0));
        expect(const Duration(days: 1825).asDecades,
            equals(1825 / TimePlusConsts.daysInDecade));
        expect(const Duration(days: 5475).asDecades,
            equals(5475 / TimePlusConsts.daysInDecade));
      });
    });

    group('asCenturies', () {
      test('returns correct number of centuries as double', () {
        expect(const Duration(days: 36500).asCenturies, equals(1.0));
        expect(const Duration(days: 73000).asCenturies, equals(2.0));
        expect(const Duration(days: 18250).asCenturies,
            equals(18250 / TimePlusConsts.daysInCentury));
        expect(const Duration(days: 54750).asCenturies,
            equals(54750 / TimePlusConsts.daysInCentury));
      });
    });

    group('edge cases', () {
      test('handles zero duration', () {
        expect(Duration.zero.fullWeeks, equals(0));
        expect(Duration.zero.fullMonths, equals(0));
        expect(Duration.zero.fullYears, equals(0));
        expect(Duration.zero.fullDecades, equals(0));
        expect(Duration.zero.fullCenturies, equals(0));
        expect(Duration.zero.asWeeks, equals(0.0));
        expect(Duration.zero.asMonths, equals(0.0));
        expect(Duration.zero.asYears, equals(0.0));
        expect(Duration.zero.asDecades, equals(0.0));
        expect(Duration.zero.asCenturies, equals(0.0));
      });

      test('handles negative duration', () {
        expect(const Duration(days: -7).fullWeeks, equals(-1));
        expect(const Duration(days: -30).fullMonths, equals(-1));
        expect(const Duration(days: -365).fullYears, equals(-1));
        expect(const Duration(days: -3650).fullDecades, equals(-1));
        expect(const Duration(days: -36500).fullCenturies, equals(-1));
        expect(const Duration(days: -7).asWeeks, equals(-1.0));
        expect(const Duration(days: -30).asMonths, equals(-1.0));
        expect(const Duration(days: -365).asYears, equals(-1.0));
        expect(const Duration(days: -3650).asDecades, equals(-1.0));
        expect(const Duration(days: -36500).asCenturies, equals(-1.0));
      });
    });
  });
}
