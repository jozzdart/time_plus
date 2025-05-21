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
        expect(const Duration(days: 30).inMonths, equals(1));
        expect(const Duration(days: 60).inMonths, equals(2));
        expect(const Duration(days: 29).inMonths, equals(0));
        expect(const Duration(days: 90).inMonths, equals(3));
      });
    });

    group('fullYears', () {
      test('returns correct number of full years', () {
        expect(const Duration(days: 365).inYears, equals(1));
        expect(const Duration(days: 730).inYears, equals(2));
        expect(const Duration(days: 364).inYears, equals(0));
        expect(const Duration(days: 1095).inYears, equals(3));
      });
    });

    group('fullDecades', () {
      test('returns correct number of full decades', () {
        expect(const Duration(days: 3650).inDecades, equals(1));
        expect(const Duration(days: 7300).inDecades, equals(2));
        expect(const Duration(days: 3649).inDecades, equals(0));
        expect(const Duration(days: 10950).inDecades, equals(3));
      });
    });
  });
}
