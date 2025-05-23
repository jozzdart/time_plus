import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('TimePlusConsts', () {
    test('daysInWeek should be 7', () {
      expect(TimePlusConsts.daysInWeek, equals(7));
    });

    test('monthsInYear should be 12', () {
      expect(TimePlusConsts.monthsInYear, equals(12));
    });

    test('daysInMonth should be 30', () {
      expect(TimePlusConsts.daysInMonth, equals(30));
    });

    test('daysInYear should be 365', () {
      expect(TimePlusConsts.daysInYear, equals(365));
    });

    test('yearsInDecade should be 10', () {
      expect(TimePlusConsts.yearsInDecade, equals(10));
    });

    test('yearsInCentury should be 100', () {
      expect(TimePlusConsts.yearsInCentury, equals(100));
    });

    test('decadesInCentury should be 10', () {
      expect(TimePlusConsts.decadesInCentury, equals(10));
    });

    test('daysInDecade should be calculated correctly', () {
      expect(
        TimePlusConsts.daysInDecade,
        equals(TimePlusConsts.daysInYear * TimePlusConsts.yearsInDecade),
      );
    });

    test('daysInCentury should be calculated correctly', () {
      expect(
        TimePlusConsts.daysInCentury,
        equals(TimePlusConsts.daysInDecade * TimePlusConsts.decadesInCentury),
      );
    });
  });
}
