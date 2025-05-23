import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DateTimeSubtractMonthsAndYearsExtension - Basic Year Subtraction', () {
    test('subtractYears returns correct DateTime for simple case', () {
      final DateTime now = DateTime(2024, 6, 15, 10, 30, 45);
      final DateTime result = now.subtractYears(2);
      expect(result, DateTime(2022, 6, 15, 10, 30, 45));
    });

    test('subtractYears with single year', () {
      final DateTime now = DateTime(2024, 3, 15);
      final DateTime result = now.subtractYears(1);
      expect(result, DateTime(2023, 3, 15));
    });

    test('subtractYears preserves time components', () {
      final DateTime now = DateTime(2024, 6, 15, 14, 25, 30, 500, 250);
      final DateTime result = now.subtractYears(3);
      expect(result, DateTime(2021, 6, 15, 14, 25, 30, 500, 250));
    });

    test('subtractYears with zero years returns same DateTime', () {
      final DateTime now = DateTime(2024, 4, 15, 10, 30);
      final DateTime result = now.subtractYears(0);
      expect(result, now);
    });

    test('subtractYear getter works correctly', () {
      final DateTime now = DateTime(2024, 5, 15);
      final DateTime result = now.subtractYear;
      expect(result, DateTime(2023, 5, 15));
    });

    test('subtractYears preserves month and day', () {
      final DateTime now = DateTime(2024, 12, 25, 18, 45);
      final DateTime result = now.subtractYears(5);
      expect(result, DateTime(2019, 12, 25, 18, 45));
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Leap Year Handling', () {
    test('subtractYears from leap day to non-leap year clamps to Feb 28', () {
      final DateTime now = DateTime(2024, 2, 29, 12, 30); // leap year
      final DateTime result = now.subtractYears(1);
      expect(result, DateTime(2023, 2, 28, 12, 30)); // clamped to Feb 28
    });

    test('subtractYears from leap day to another leap year preserves Feb 29',
        () {
      final DateTime now = DateTime(2024, 2, 29, 15, 45); // leap year
      final DateTime result = now.subtractYears(4);
      expect(result, DateTime(2020, 2, 29, 15, 45)); // another leap year
    });

    test('subtractYears from non-leap year to leap year preserves Feb 28', () {
      final DateTime now = DateTime(2023, 2, 28, 9, 15); // non-leap year
      final DateTime result = now.subtractYears(1);
      expect(result, DateTime(2022, 2, 28, 9, 15)); // non-leap year
    });

    test('subtractYears from March 1 in leap year to non-leap year', () {
      final DateTime now = DateTime(2024, 3, 1, 10, 0); // day after leap day
      final DateTime result = now.subtractYears(1);
      expect(result, DateTime(2023, 3, 1, 10, 0)); // March 1 in non-leap year
    });

    test('subtractYears multiple leap year cycles', () {
      final DateTime now = DateTime(2024, 2, 29, 14, 30); // leap year
      final DateTime result = now.subtractYears(8); // 2 leap year cycles
      expect(result, DateTime(2016, 2, 29, 14, 30)); // another leap year
    });

    test('subtractYears from leap day to century year (non-leap)', () {
      final DateTime now = DateTime(2004, 2, 29, 16, 20); // leap year
      final DateTime result = now.subtractYears(4);
      expect(result, DateTime(2000, 2, 29, 16, 20)); // century leap year
    });

    test('subtractYears handles century non-leap year correctly', () {
      final DateTime now = DateTime(2004, 2, 29, 11, 45); // leap year
      final DateTime result = now.subtractYears(104);
      expect(result, DateTime(1900, 2, 28, 11, 45)); // 1900 was not a leap year
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Day Clamping Edge Cases',
      () {
    test('subtractYears preserves valid days when no clamping needed', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now.subtractYears(10);
      expect(result, DateTime(2014, 6, 15));
    });

    test('subtractYears from Feb 29 to multiple non-leap years', () {
      final DateTime now = DateTime(2024, 2, 29); // leap year
      final DateTime result1 = now.subtractYears(1); // 2023 - non-leap
      final DateTime result2 = now.subtractYears(2); // 2022 - non-leap
      final DateTime result3 = now.subtractYears(3); // 2021 - non-leap

      expect(result1, DateTime(2023, 2, 28));
      expect(result2, DateTime(2022, 2, 28));
      expect(result3, DateTime(2021, 2, 28));
    });

    test('subtractYears preserves all other days throughout year', () {
      final testDates = [
        DateTime(2024, 1, 31), // Jan 31
        DateTime(2024, 3, 31), // Mar 31
        DateTime(2024, 4, 30), // Apr 30
        DateTime(2024, 5, 31), // May 31
        DateTime(2024, 6, 30), // Jun 30
        DateTime(2024, 7, 31), // Jul 31
        DateTime(2024, 8, 31), // Aug 31
        DateTime(2024, 9, 30), // Sep 30
        DateTime(2024, 10, 31), // Oct 31
        DateTime(2024, 11, 30), // Nov 30
        DateTime(2024, 12, 31), // Dec 31
      ];

      for (final date in testDates) {
        final result = date.subtractYears(3);
        expect(result.year, 2021);
        expect(result.month, date.month);
        expect(result.day, date.day);
      }
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Large Year Values', () {
    test('subtractYears with very large value', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now.subtractYears(100);
      expect(result, DateTime(1924, 6, 15));
    });

    test('subtractYears spanning multiple centuries', () {
      final DateTime now = DateTime(2024, 7, 4, 12, 0);
      final DateTime result = now.subtractYears(424);
      expect(result, DateTime(1600, 7, 4, 12, 0));
    });

    test('subtractYears going back to year 1', () {
      final DateTime now = DateTime(2024, 12, 25);
      final DateTime result = now.subtractYears(2023);
      expect(result, DateTime(1, 12, 25));
    });

    test('subtractYears with millennium span', () {
      final DateTime now = DateTime(2024, 1, 1, 0, 0);
      final DateTime result = now.subtractYears(1024);
      expect(result, DateTime(1000, 1, 1, 0, 0));
    });
  });

  group(
      'DateTimeSubtractMonthsAndYearsExtension - UTC and Timezone Preservation',
      () {
    test('subtractYears preserves UTC flag when true', () {
      final DateTime utcNow = DateTime.utc(2024, 5, 15, 10, 30);
      final DateTime result = utcNow.subtractYears(3);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2021, 5, 15, 10, 30));
    });

    test('subtractYears preserves local timezone when false', () {
      final DateTime localNow = DateTime(2024, 5, 15, 10, 30);
      final DateTime result = localNow.subtractYears(2);
      expect(result.isUtc, false);
      expect(result, DateTime(2022, 5, 15, 10, 30));
    });

    test('subtractYear getter preserves UTC flag', () {
      final DateTime utcNow = DateTime.utc(2024, 5, 15);
      final DateTime result = utcNow.subtractYear;
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2023, 5, 15));
    });

    test('subtractYears UTC with leap day clamping', () {
      final DateTime utcNow = DateTime.utc(2024, 2, 29, 14, 30, 45);
      final DateTime result = utcNow.subtractYears(1);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2023, 2, 28, 14, 30, 45));
    });

    test('subtractYears preserves exact UTC time components', () {
      final DateTime utcNow = DateTime.utc(2024, 8, 15, 23, 59, 59, 999, 999);
      final DateTime result = utcNow.subtractYears(5);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2019, 8, 15, 23, 59, 59, 999, 999));
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Negative Values', () {
    test('subtractYears with negative value adds years', () {
      final DateTime now = DateTime(2024, 3, 15);
      final DateTime result = now.subtractYears(-5);
      expect(result, DateTime(2029, 3, 15));
    });

    test('subtractYears with negative value from non-leap to leap year', () {
      final DateTime now = DateTime(2023, 2, 28); // non-leap year
      final DateTime result =
          now.subtractYears(-1); // equivalent to adding 1 year
      expect(result, DateTime(2024, 2, 28)); // Feb 28 preserved in leap year
    });

    test('subtractYears with negative value requires day clamping', () {
      final DateTime now = DateTime(2023, 2, 28);
      final DateTime result =
          now.subtractYears(-1); // add 1 year to reach 2024 (leap year)
      expect(result,
          DateTime(2024, 2, 28)); // should stay Feb 28, not become Feb 29
    });

    test('subtractYears with large negative value', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now.subtractYears(-50);
      expect(result, DateTime(2074, 6, 15));
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Complex Scenarios', () {
    test('subtractYears multiple times in sequence', () {
      final DateTime now = DateTime(2024, 7, 15, 16, 30);
      final DateTime result = now
          .subtractYears(1) // 2023
          .subtractYears(2) // 2021
          .subtractYears(3); // 2018
      expect(result, DateTime(2018, 7, 15, 16, 30));
    });

    test('subtractYears chained with leap day handling', () {
      final DateTime now = DateTime(2024, 2, 29, 12, 0); // leap day
      final DateTime result = now
          .subtractYears(1) // 2023, Feb 28 (clamped)
          .subtractYears(1) // 2022, Feb 28
          .subtractYears(2); // 2020, Feb 28 (even though 2020 is leap year)
      expect(result, DateTime(2020, 2, 28, 12, 0));
    });

    test('subtractYears preserves milliseconds and microseconds', () {
      final DateTime now = DateTime(2024, 9, 21, 14, 35, 45, 123, 456);
      final DateTime result = now.subtractYears(7);
      expect(result, DateTime(2017, 9, 21, 14, 35, 45, 123, 456));
    });

    test('subtractYears alternating positive and negative', () {
      final DateTime now = DateTime(2024, 4, 10);
      final DateTime result = now
          .subtractYears(5) // 2019
          .subtractYears(-2) // 2021
          .subtractYears(1); // 2020
      expect(result, DateTime(2020, 4, 10));
    });

    test('subtractYears with year boundaries at different months', () {
      final dates = [
        DateTime(2024, 1, 15), // January
        DateTime(2024, 6, 15), // June
        DateTime(2024, 12, 15), // December
      ];

      for (final date in dates) {
        final result = date.subtractYears(10);
        expect(result.year, 2014);
        expect(result.month, date.month);
        expect(result.day, date.day);
      }
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Historical Year Edge Cases',
      () {
    test('subtractYears handles various century boundaries', () {
      final DateTime now = DateTime(2024, 3, 15);

      // Test going back to different centuries
      expect(now.subtractYears(24), DateTime(2000, 3, 15)); // Y2K
      expect(
          now.subtractYears(124), DateTime(1900, 3, 15)); // 20th century start
      expect(
          now.subtractYears(224), DateTime(1800, 3, 15)); // 19th century start
    });

    test('subtractYears from current year to various historical periods', () {
      final DateTime now = DateTime(2024, 7, 4, 12, 0); // Independence Day

      // Various historical spans
      expect(
          now.subtractYears(50), DateTime(1974, 7, 4, 12, 0)); // 50 years ago
      expect(
          now.subtractYears(100), DateTime(1924, 7, 4, 12, 0)); // 100 years ago
      expect(now.subtractYears(248),
          DateTime(1776, 7, 4, 12, 0)); // US Independence
    });

    test('subtractYears handles leap year in year 2000', () {
      final DateTime now = DateTime(2004, 2, 29); // leap year
      final DateTime result = now.subtractYears(4);
      expect(result,
          DateTime(2000, 2, 29)); // 2000 was a leap year (divisible by 400)
    });

    test('subtractYears handles non-leap century year 1900', () {
      final DateTime now = DateTime(2000, 2, 29); // leap year
      final DateTime result = now.subtractYears(100);
      expect(
          result,
          DateTime(1900, 2,
              28)); // 1900 was not a leap year (divisible by 100 but not 400)
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Performance and Edge Cases',
      () {
    test('subtractYears with very large value preserves precision', () {
      final DateTime now = DateTime(2024, 11, 11, 11, 11, 11, 111, 111);
      final DateTime result = now.subtractYears(1000);
      expect(result, DateTime(1024, 11, 11, 11, 11, 11, 111, 111));
    });

    test('subtractYear getter with complex DateTime', () {
      final DateTime now = DateTime(2024, 8, 31, 23, 59, 59, 999, 999);
      final DateTime result = now.subtractYear;
      expect(result, DateTime(2023, 8, 31, 23, 59, 59, 999, 999));
    });

    test('subtractYears creates new instance, not reference', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now.subtractYears(0);
      expect(result, now);
      expect(identical(result, now), false);
    });

    test('subtractYears with mixed operations on same DateTime', () {
      final DateTime base = DateTime(2024, 5, 15, 10, 30);

      final result1 = base.subtractYears(1);
      final result2 = base.subtractYears(2);
      final result3 = base.subtractYears(3);

      expect(result1, DateTime(2023, 5, 15, 10, 30));
      expect(result2, DateTime(2022, 5, 15, 10, 30));
      expect(result3, DateTime(2021, 5, 15, 10, 30));

      // Original should be unchanged
      expect(base, DateTime(2024, 5, 15, 10, 30));
    });
  });

  group(
      'DateTimeSubtractMonthsAndYearsExtension - Comprehensive UTC Years Tests',
      () {
    test('subtractYears UTC with leap day to non-leap year', () {
      final DateTime utcNow = DateTime.utc(2024, 2, 29, 18, 45, 30);
      final DateTime result = utcNow.subtractYears(1);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2023, 2, 28, 18, 45, 30));
    });

    test('subtractYears UTC preserves exact time across centuries', () {
      final DateTime utcNow = DateTime.utc(2024, 12, 31, 23, 59, 59, 999);
      final DateTime result = utcNow.subtractYears(124);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(1900, 12, 31, 23, 59, 59, 999));
    });

    test('subtractYears UTC chained operations preserve flag', () {
      final DateTime utcNow = DateTime.utc(2024, 6, 15, 12, 0, 0);
      final DateTime result =
          utcNow.subtractYears(2).subtractYears(3).subtractYears(5);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2014, 6, 15, 12, 0, 0));
    });

    test('subtractYear getter preserves UTC with microsecond precision', () {
      final DateTime utcNow = DateTime.utc(2024, 3, 15, 9, 30, 45, 123, 456);
      final DateTime result = utcNow.subtractYear;
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2023, 3, 15, 9, 30, 45, 123, 456));
    });

    test('subtractYears UTC handles year 2000 leap year correctly', () {
      final DateTime utcNow = DateTime.utc(2004, 2, 29, 6, 15, 30);
      final DateTime result = utcNow.subtractYears(4);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2000, 2, 29, 6, 15, 30)); // 2000 is leap year
    });
  });
}
