import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('TimePlusConsts', () {
    test('monthsInYear should be 12', () {
      expect(TimePlusConsts.monthsInYear, equals(12));
    });

    test('daysInMonth should be the precise Gregorian average', () {
      expect(TimePlusConsts.averageDaysPerMonth, equals(30.436875));
    });

    test('daysInYear should be the precise Gregorian average', () {
      expect(TimePlusConsts.averageDaysPerYear, equals(365.2425));
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
        TimePlusConsts.averageDaysPerDecade,
        equals(
            TimePlusConsts.averageDaysPerYear * TimePlusConsts.yearsInDecade),
      );
    });

    test('daysInCentury should be calculated correctly', () {
      expect(
        TimePlusConsts.averageDaysPerCentury,
        equals(TimePlusConsts.averageDaysPerDecade *
            TimePlusConsts.decadesInCentury),
      );
    });

    // Approximate constants for quick calculations
    test('approxDaysInMonth should be 30', () {
      expect(TimePlusConsts.roundedDaysPerMonth, equals(30));
    });

    test('approxDaysInYear should be 365', () {
      expect(TimePlusConsts.roundedDaysPerYear, equals(365));
    });

    test('approxDaysInDecade should be 3652', () {
      expect(TimePlusConsts.roundedDaysInDecade, equals(3652));
    });

    test('approxDaysInCentury should be 36524', () {
      expect(TimePlusConsts.roundedDaysInCentury, equals(36524));
    });
  });
}
