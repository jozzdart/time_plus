import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DateTimeSubtractMonthsAndYearsExtension - Basic Month Subtraction',
      () {
    test('subtractMonths returns correct DateTime for simple case', () {
      final DateTime now = DateTime(2024, 5, 15, 10, 30, 45);
      final DateTime result = now.subtractMonths(2);
      expect(result, DateTime(2024, 3, 15, 10, 30, 45));
    });

    test('subtractMonths with single month', () {
      final DateTime now = DateTime(2024, 3, 15);
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2024, 2, 15));
    });

    test('subtractMonths preserves time components', () {
      final DateTime now = DateTime(2024, 6, 15, 14, 25, 30, 500, 250);
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2024, 5, 15, 14, 25, 30, 500, 250));
    });

    test('subtractMonths with zero months returns same DateTime', () {
      final DateTime now = DateTime(2024, 4, 15, 10, 30);
      final DateTime result = now.subtractMonths(0);
      expect(result, now);
    });

    test('subtractMonth getter works correctly', () {
      final DateTime now = DateTime(2024, 5, 15);
      final DateTime result = now.subtractMonth;
      expect(result, DateTime(2024, 4, 15));
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Year Boundary Crossing', () {
    test('subtractMonths crosses year boundary', () {
      final DateTime now = DateTime(2024, 2, 15);
      final DateTime result = now.subtractMonths(3);
      expect(result, DateTime(2023, 11, 15));
    });

    test('subtractMonths from January goes to previous year', () {
      final DateTime now = DateTime(2024, 1, 15);
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2023, 12, 15));
    });

    test('subtractMonths crosses multiple years', () {
      final DateTime now = DateTime(2024, 3, 15);
      final DateTime result = now.subtractMonths(15);
      expect(result, DateTime(2022, 12, 15));
    });

    test('subtractMonths with large value spans multiple years', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now.subtractMonths(30);
      expect(result, DateTime(2021, 12, 15));
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Day Clamping', () {
    test(
        'subtractMonths clamps day when target month has fewer days - March 31 to Feb',
        () {
      final DateTime now = DateTime(2024, 3, 31); // March 31
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2024, 2, 29)); // 2024 is leap year
    });

    test(
        'subtractMonths clamps day when target month has fewer days - March 31 to Feb (non-leap)',
        () {
      final DateTime now = DateTime(2023, 3, 31); // March 31
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2023, 2, 28)); // 2023 is not leap year
    });

    test('subtractMonths clamps day from May 31 to April 30', () {
      final DateTime now = DateTime(2024, 5, 31);
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2024, 4, 30));
    });

    test('subtractMonths clamps day from July 31 to June 30', () {
      final DateTime now = DateTime(2024, 7, 31);
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2024, 6, 30));
    });

    test('subtractMonths clamps day from August 31 to June 30', () {
      final DateTime now = DateTime(2024, 8, 31);
      final DateTime result = now.subtractMonths(2);
      expect(result, DateTime(2024, 6, 30));
    });

    test('subtractMonths clamps day from October 31 to February 28', () {
      final DateTime now = DateTime(2023, 10, 31);
      final DateTime result = now.subtractMonths(8);
      expect(result, DateTime(2023, 2, 28));
    });

    test(
        'subtractMonths clamps day from December 31 to February 29 (leap year)',
        () {
      final DateTime now = DateTime(2024, 12, 31);
      final DateTime result = now.subtractMonths(10);
      expect(result, DateTime(2024, 2, 29));
    });

    test('subtractMonths preserves valid days when no clamping needed', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now.subtractMonths(2);
      expect(result, DateTime(2024, 4, 15));
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Leap Year Handling', () {
    test('subtractMonths from March 1 to February 29 in leap year', () {
      final DateTime now = DateTime(2024, 3, 1); // 2024 is leap year
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2024, 2, 1));
    });

    test('subtractMonths from March 1 to February 28 in non-leap year', () {
      final DateTime now = DateTime(2023, 3, 1); // 2023 is not leap year
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2023, 2, 1));
    });

    test('subtractMonths from February 29 to January 29', () {
      final DateTime now = DateTime(2024, 2, 29); // leap year
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2024, 1, 29));
    });

    test('subtractMonths from March 29 in leap year to February 29', () {
      final DateTime now = DateTime(2024, 3, 29);
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2024, 2, 29));
    });

    test('subtractMonths from March 29 in non-leap year to February 28', () {
      final DateTime now = DateTime(2023, 3, 29);
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2023, 2, 28));
    });

    test('subtractMonths across leap year boundary', () {
      final DateTime now = DateTime(2025, 2, 28); // 2025 is not leap year
      final DateTime result = now.subtractMonths(12);
      expect(result, DateTime(2024, 2, 28)); // 2024 is leap year
    });
  });

  group(
      'DateTimeSubtractMonthsAndYearsExtension - UTC and Timezone Preservation',
      () {
    test('subtractMonths preserves UTC flag when true', () {
      final DateTime utcNow = DateTime.utc(2024, 5, 15, 10, 30);
      final DateTime result = utcNow.subtractMonths(2);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2024, 3, 15, 10, 30));
    });

    test('subtractMonths preserves local timezone when false', () {
      final DateTime localNow = DateTime(2024, 5, 15, 10, 30);
      final DateTime result = localNow.subtractMonths(2);
      expect(result.isUtc, false);
      expect(result, DateTime(2024, 3, 15, 10, 30));
    });

    test('subtractMonth getter preserves UTC flag', () {
      final DateTime utcNow = DateTime.utc(2024, 5, 15);
      final DateTime result = utcNow.subtractMonth;
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2024, 4, 15));
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Comprehensive UTC Tests',
      () {
    test('subtractMonths with UTC DateTime preserves exact time components',
        () {
      final DateTime utcNow = DateTime.utc(2024, 6, 15, 14, 25, 30, 500, 250);
      final DateTime result = utcNow.subtractMonths(3);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2024, 3, 15, 14, 25, 30, 500, 250));
    });

    test('subtractMonths with UTC DateTime near midnight', () {
      final DateTime utcNow = DateTime.utc(2024, 5, 15, 0, 0, 0);
      final DateTime result = utcNow.subtractMonths(2);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2024, 3, 15, 0, 0, 0));
    });

    test('subtractMonths with UTC DateTime at end of day', () {
      final DateTime utcNow = DateTime.utc(2024, 5, 15, 23, 59, 59, 999, 999);
      final DateTime result = utcNow.subtractMonths(1);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2024, 4, 15, 23, 59, 59, 999, 999));
    });

    test('subtractMonths with UTC DateTime crosses year boundary', () {
      final DateTime utcNow = DateTime.utc(2024, 2, 15, 12, 30, 45);
      final DateTime result = utcNow.subtractMonths(3);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2023, 11, 15, 12, 30, 45));
    });

    test('subtractMonths with UTC DateTime requires day clamping', () {
      final DateTime utcNow = DateTime.utc(2024, 3, 31, 15, 45, 30);
      final DateTime result = utcNow.subtractMonths(1);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2024, 2, 29, 15, 45, 30)); // leap year
    });

    test('subtractMonths with UTC DateTime from leap day', () {
      final DateTime utcNow = DateTime.utc(2024, 2, 29, 10, 15, 20);
      final DateTime result = utcNow.subtractMonths(1);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2024, 1, 29, 10, 15, 20));
    });

    test('subtractMonths with UTC DateTime to non-leap year February', () {
      final DateTime utcNow = DateTime.utc(2024, 3, 29, 8, 30, 15);
      final DateTime result = utcNow.subtractMonths(13); // goes to 2023
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2023, 2, 28, 8, 30, 15)); // clamped to Feb 28
    });

    test('subtractMonths UTC with zero months returns identical UTC DateTime',
        () {
      final DateTime utcNow = DateTime.utc(2024, 4, 15, 16, 45, 30, 123, 456);
      final DateTime result = utcNow.subtractMonths(0);
      expect(result.isUtc, true);
      expect(result, utcNow);
      expect(identical(result, utcNow), false); // should be new instance
    });

    test('subtractMonths UTC chained operations preserve UTC flag', () {
      final DateTime utcNow = DateTime.utc(2024, 12, 31, 23, 59, 59);
      final DateTime result = utcNow
          .subtractMonths(1) // Nov 30
          .subtractMonths(2) // Sep 30
          .subtractMonths(3); // Jun 30
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2024, 6, 30, 23, 59, 59));
    });

    test('subtractMonths UTC with negative value (adding months)', () {
      final DateTime utcNow = DateTime.utc(2024, 1, 31, 12, 0, 0);
      final DateTime result = utcNow.subtractMonths(-1); // add 1 month
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2024, 2, 29, 12, 0, 0)); // clamped to Feb 29
    });

    test('subtractMonths UTC with very large value spans multiple years', () {
      final DateTime utcNow = DateTime.utc(2024, 6, 15, 9, 30, 45);
      final DateTime result = utcNow.subtractMonths(30); // 2.5 years
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2021, 12, 15, 9, 30, 45));
    });

    test('subtractMonth getter preserves UTC with complex time', () {
      final DateTime utcNow = DateTime.utc(2024, 8, 15, 18, 45, 30, 750, 500);
      final DateTime result = utcNow.subtractMonth;
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2024, 7, 15, 18, 45, 30, 750, 500));
    });

    test('subtractMonths UTC mixed with local DateTime operations', () {
      final DateTime utcNow = DateTime.utc(2024, 5, 31, 14, 30, 0);
      final DateTime localNow = DateTime(2024, 5, 31, 14, 30, 0);

      final DateTime utcResult = utcNow.subtractMonths(1);
      final DateTime localResult = localNow.subtractMonths(1);

      expect(utcResult.isUtc, true);
      expect(localResult.isUtc, false);
      expect(utcResult, DateTime.utc(2024, 4, 30, 14, 30, 0));
      expect(localResult, DateTime(2024, 4, 30, 14, 30, 0));
    });

    test('subtractMonths UTC from January 1st crosses year boundary', () {
      final DateTime utcNow = DateTime.utc(2024, 1, 1, 0, 0, 0);
      final DateTime result = utcNow.subtractMonths(1);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2023, 12, 1, 0, 0, 0));
    });

    test('subtractMonths UTC with millisecond precision preservation', () {
      final DateTime utcNow = DateTime.utc(2024, 10, 31, 11, 22, 33, 444);
      final DateTime result = utcNow.subtractMonths(2);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2024, 8, 31, 11, 22, 33, 444));
    });

    test('subtractMonths UTC handles February edge case in leap year', () {
      final DateTime utcNow = DateTime.utc(2024, 4, 30, 20, 15, 10);
      final DateTime result = utcNow.subtractMonths(2); // goes to Feb
      expect(result.isUtc, true);
      expect(
          result, DateTime.utc(2024, 2, 29, 20, 15, 10)); // Feb 29 in leap year
    });

    test('subtractMonths UTC handles February edge case in non-leap year', () {
      final DateTime utcNow = DateTime.utc(2023, 4, 30, 20, 15, 10);
      final DateTime result = utcNow.subtractMonths(2); // goes to Feb 2023
      expect(result.isUtc, true);
      expect(result,
          DateTime.utc(2023, 2, 28, 20, 15, 10)); // Feb 28 in non-leap year
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Edge Cases', () {
    test('subtractMonths with very large value', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now.subtractMonths(120); // 10 years
      expect(result, DateTime(2014, 6, 15));
    });

    test('subtractMonths going back to year 1', () {
      final DateTime now = DateTime(5, 3, 15);
      final DateTime result = now.subtractMonths(50);
      expect(result, DateTime(1, 1, 15));
    });

    test('subtractMonths with day 1 never needs clamping', () {
      final DateTime now = DateTime(2024, 3, 1);
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2024, 2, 1));
    });

    test('subtractMonths from February 28 to January 28', () {
      final DateTime now = DateTime(2024, 2, 28);
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2024, 1, 28));
    });

    test('subtractMonths from February 29 to January 29', () {
      final DateTime now = DateTime(2024, 2, 29);
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2024, 1, 29));
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Negative Values', () {
    test('subtractMonths with negative value adds months', () {
      final DateTime now = DateTime(2024, 3, 15);
      final DateTime result = now.subtractMonths(-2);
      expect(result, DateTime(2024, 5, 15));
    });

    test('subtractMonths with negative value crosses year boundary', () {
      final DateTime now = DateTime(2023, 11, 15);
      final DateTime result = now.subtractMonths(-3);
      expect(result, DateTime(2024, 2, 15));
    });

    test('subtractMonths with negative value requires day clamping', () {
      final DateTime now = DateTime(2024, 1, 31);
      final DateTime result =
          now.subtractMonths(-1); // equivalent to adding 1 month
      expect(result, DateTime(2024, 2, 29)); // clamped to Feb 29 in leap year
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Complex Scenarios', () {
    test('subtractMonths multiple times in sequence', () {
      final DateTime now = DateTime(2024, 12, 31);
      final DateTime result = now
          .subtractMonths(1) // Nov 30
          .subtractMonths(1) // Oct 30
          .subtractMonths(1); // Sep 30
      expect(result, DateTime(2024, 9, 30));
    });

    test('subtractMonths with day clamping chain', () {
      final DateTime now = DateTime(2024, 5, 31);
      final DateTime result = now
          .subtractMonths(1) // April 30 (clamped)
          .subtractMonths(1) // March 30
          .subtractMonths(1); // February 29 (clamped, leap year)
      expect(result, DateTime(2024, 2, 29));
    });

    test('subtractMonths preserves milliseconds and microseconds', () {
      final DateTime now = DateTime(2024, 6, 15, 10, 30, 45, 123, 456);
      final DateTime result = now.subtractMonths(3);
      expect(result, DateTime(2024, 3, 15, 10, 30, 45, 123, 456));
    });

    test('subtractMonths from end of month to shorter month multiple times',
        () {
      final DateTime now = DateTime(2024, 7, 31);
      final DateTime result = now
          .subtractMonths(1) // June 30
          .subtractMonths(1) // May 30
          .subtractMonths(3); // February 29
      expect(result, DateTime(2024, 2, 29));
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Month-Year Edge Cases', () {
    test('subtractMonths from January 1 to December of previous year', () {
      final DateTime now = DateTime(2024, 1, 1);
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2023, 12, 1));
    });

    test('subtractMonths exactly 12 months', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now.subtractMonths(12);
      expect(result, DateTime(2023, 6, 15));
    });

    test('subtractMonths with 13 months', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now.subtractMonths(13);
      expect(result, DateTime(2023, 5, 15));
    });

    test('subtractMonths from leap day to non-leap year', () {
      final DateTime now = DateTime(2024, 2, 29); // leap year
      final DateTime result = now.subtractMonths(12);
      expect(
          result, DateTime(2023, 2, 28)); // clamped to Feb 28 in non-leap year
    });
  });

  group('DateTimeSubtractMonthsAndYearsExtension - Performance Edge Cases', () {
    test('subtractMonths with very large negative value', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now.subtractMonths(-240); // adding 20 years
      expect(result, DateTime(2044, 6, 15));
    });

    test('subtractMonths alternating positive and negative', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now
          .subtractMonths(6) // Dec 2023
          .subtractMonths(-3) // Mar 2024
          .subtractMonths(2); // Jan 2024
      expect(result, DateTime(2024, 1, 15));
    });

    test('subtractMonths preserves exact time down to microseconds', () {
      final DateTime now = DateTime(2024, 8, 31, 23, 59, 59, 999, 999);
      final DateTime result = now.subtractMonths(1);
      expect(result, DateTime(2024, 7, 31, 23, 59, 59, 999, 999));
    });
  });
}
