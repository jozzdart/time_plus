import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DateTimeIn.daysInYear', () {
    group('Common year (non-leap year)', () {
      test('returns 365 for regular non-leap years', () {
        expect(DateTime(2023, 1, 1).daysInYear, 365);
        expect(DateTime(2025, 1, 1).daysInYear, 365);
        expect(DateTime(2026, 1, 1).daysInYear, 365);
        expect(DateTime(2027, 1, 1).daysInYear, 365);
      });

      test('returns 365 for century years not divisible by 400', () {
        expect(DateTime(1900, 1, 1).daysInYear, 365);
        expect(DateTime(2100, 1, 1).daysInYear, 365);
        expect(DateTime(2200, 1, 1).daysInYear, 365);
        expect(DateTime(2300, 1, 1).daysInYear, 365);
      });
    });

    group('Leap year', () {
      test('returns 366 for regular leap years', () {
        expect(DateTime(2020, 1, 1).daysInYear, 366);
        expect(DateTime(2024, 1, 1).daysInYear, 366);
        expect(DateTime(2028, 1, 1).daysInYear, 366);
        expect(DateTime(2032, 1, 1).daysInYear, 366);
      });

      test('returns 366 for century years divisible by 400', () {
        expect(DateTime(2000, 1, 1).daysInYear, 366);
        expect(DateTime(2400, 1, 1).daysInYear, 366);
        expect(DateTime(1600, 1, 1).daysInYear, 366);
      });
    });

    group('Day independence', () {
      test('returns same result regardless of day in year', () {
        // Test leap year
        expect(DateTime(2024, 1, 1).daysInYear, 366);
        expect(DateTime(2024, 6, 15).daysInYear, 366);
        expect(DateTime(2024, 12, 31).daysInYear, 366);

        // Test non-leap year
        expect(DateTime(2023, 1, 1).daysInYear, 365);
        expect(DateTime(2023, 6, 15).daysInYear, 365);
        expect(DateTime(2023, 12, 31).daysInYear, 365);
      });
    });

    group('Time independence', () {
      test('returns same result regardless of time of day', () {
        expect(DateTime(2024, 1, 1, 0, 0, 0).daysInYear, 366);
        expect(DateTime(2024, 1, 1, 12, 30, 45).daysInYear, 366);
        expect(DateTime(2024, 1, 1, 23, 59, 59).daysInYear, 366);

        expect(DateTime(2023, 1, 1, 0, 0, 0).daysInYear, 365);
        expect(DateTime(2023, 1, 1, 12, 30, 45).daysInYear, 365);
        expect(DateTime(2023, 1, 1, 23, 59, 59).daysInYear, 365);
      });
    });

    group('Historical and future dates', () {
      test('works correctly for historical dates', () {
        expect(DateTime(1900, 1, 1).daysInYear, 365); // Not a leap year
        expect(DateTime(1600, 1, 1).daysInYear, 366); // Leap year
        expect(DateTime(1700, 1, 1).daysInYear, 365); // Not a leap year
        expect(DateTime(1800, 1, 1).daysInYear, 365); // Not a leap year
      });

      test('works correctly for future dates', () {
        expect(DateTime(2100, 1, 1).daysInYear, 365); // Not a leap year
        expect(DateTime(2400, 1, 1).daysInYear, 366); // Leap year
        expect(DateTime(2500, 1, 1).daysInYear, 365); // Not a leap year
      });
    });

    group('UTC and local time consistency', () {
      test('returns same result for UTC and local time', () {
        final local = DateTime(2024, 1, 1, 12, 30);
        final utc = DateTime.utc(2024, 1, 1, 12, 30);

        expect(local.daysInYear, utc.daysInYear);
      });
    });

    group('Edge cases', () {
      test('works with minimum valid year', () {
        expect(DateTime(1, 1, 1).daysInYear, 365); // Not a leap year
      });

      test('works with maximum valid year', () {
        expect(DateTime(9999, 1, 1).daysInYear, 365); // Not a leap year
      });
    });
  });
}
