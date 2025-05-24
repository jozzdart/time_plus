import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DurationInGettersExtensions', () {
    group('fullWeeks', () {
      test('returns correct number of full weeks', () {
        expect(const Duration(days: 7).inWeeks, equals(1));
        expect(const Duration(days: 14).inWeeks, equals(2));
        expect(const Duration(days: 6).inWeeks, equals(0));
        expect(const Duration(days: 20).inWeeks, equals(2));
      });
    });

    group('fullMonths', () {
      test('returns correct number of full months', () {
        expect(const Duration(days: 31).inMonths, equals(1));
        expect(const Duration(days: 61).inMonths, equals(2));
        expect(const Duration(days: 29).inMonths, equals(0));
        expect(const Duration(days: 92).inMonths, equals(3));
      });
    });

    group('fullYears', () {
      test('returns correct number of full years', () {
        expect(const Duration(days: 365, hours: 8).inYears, equals(1));
        expect(const Duration(days: 730, hours: 16).inYears, equals(2));
        expect(const Duration(days: 364, hours: 23, minutes: 59).inYears,
            equals(0));
        expect(const Duration(days: 365).inYears, equals(0));
        expect(const Duration(days: 1096).inYears, equals(3));
      });
    });

    group('fullDecades', () {
      test('returns correct number of full decades', () {
        expect(const Duration(days: 3652, hours: 12).inDecades, equals(1));
        expect(const Duration(days: 7304, hours: 23).inDecades, equals(2));
        expect(const Duration(days: 3651, hours: 23, minutes: 59).inDecades,
            equals(0));
        expect(const Duration(days: 3652).inDecades, equals(0));
        expect(const Duration(days: 10957, hours: 11).inDecades, equals(3));
      });
    });

    group('fullCenturies', () {
      test('returns correct number of full centuries', () {
        expect(const Duration(days: 36524, hours: 6).inCenturies, equals(1));
        expect(const Duration(days: 73048, hours: 12).inCenturies, equals(2));
        expect(const Duration(days: 36523, hours: 23, minutes: 59).inCenturies,
            equals(0));
        expect(const Duration(days: 36524).inCenturies, equals(0));
        expect(const Duration(days: 109572, hours: 18).inCenturies, equals(3));
      });
    });
  });
}
