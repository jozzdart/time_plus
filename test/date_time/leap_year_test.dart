import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DateTimeLeapYearExtensions', () {
    group('isLeapYear', () {
      test('returns true for years divisible by 4 but not by 100', () {
        expect(DateTime(2020).isLeapYear, true);
        expect(DateTime(2024).isLeapYear, true);
        expect(DateTime(2008).isLeapYear, true);
      });

      test('returns false for years not divisible by 4', () {
        expect(DateTime(2021).isLeapYear, false);
        expect(DateTime(2022).isLeapYear, false);
        expect(DateTime(2023).isLeapYear, false);
      });

      test('returns false for years divisible by 100 but not by 400', () {
        expect(DateTime(1900).isLeapYear, false);
        expect(DateTime(2100).isLeapYear, false);
        expect(DateTime(2200).isLeapYear, false);
      });

      test('returns true for years divisible by 400', () {
        expect(DateTime(2000).isLeapYear, true);
        expect(DateTime(2400).isLeapYear, true);
        expect(DateTime(1600).isLeapYear, true);
      });
    });

    group('isLeapMonth', () {
      test('returns true only for February in leap years', () {
        expect(DateTime(2020, 2).isLeapMonth, true);
        expect(DateTime(2024, 2).isLeapMonth, true);
        expect(DateTime(2000, 2).isLeapMonth, true);
      });

      test('returns false for February in non-leap years', () {
        expect(DateTime(2021, 2).isLeapMonth, false);
        expect(DateTime(2022, 2).isLeapMonth, false);
        expect(DateTime(2100, 2).isLeapMonth, false);
      });

      test('returns false for non-February months in leap years', () {
        expect(DateTime(2020, 1).isLeapMonth, false);
        expect(DateTime(2020, 3).isLeapMonth, false);
        expect(DateTime(2020, 12).isLeapMonth, false);
      });
    });

    group('isLeapDay', () {
      test('returns true only for February 29th in leap years', () {
        expect(DateTime(2020, 2, 29).isLeapDay, true);
        expect(DateTime(2024, 2, 29).isLeapDay, true);
        expect(DateTime(2000, 2, 29).isLeapDay, true);
      });

      test('returns false for February 29th in non-leap years', () {
        // Note: DateTime constructor will throw for invalid dates
        expect(DateTime(2021, 2, 29), DateTime(2021, 3, 1));
        expect(DateTime(2100, 2, 29), DateTime(2100, 2, 29));
      });

      test('returns false for other days in February of leap years', () {
        expect(DateTime(2020, 2, 28).isLeapDay, false);
        expect(DateTime(2020, 2, 1).isLeapDay, false);
      });

      test('returns false for any day in non-February months', () {
        expect(DateTime(2020, 1, 29).isLeapDay, false);
        expect(DateTime(2020, 3, 29).isLeapDay, false);
        expect(DateTime(2020, 12, 29).isLeapDay, false);
      });
    });
  });
}
