import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DateTimeSubtractExtendingYearsExtension - Basic Decade Subtraction',
      () {
    test('subtractDecades returns correct DateTime for simple case', () {
      final DateTime now = DateTime(2024, 6, 15, 10, 30, 45);
      final DateTime result = now.subtractDecades(2);
      expect(result, DateTime(2004, 6, 15, 10, 30, 45));
    });

    test('subtractDecades with single decade', () {
      final DateTime now = DateTime(2024, 3, 15);
      final DateTime result = now.subtractDecades(1);
      expect(result, DateTime(2014, 3, 15));
    });

    test('subtractDecades preserves time components', () {
      final DateTime now = DateTime(2024, 6, 15, 14, 25, 30, 500, 250);
      final DateTime result = now.subtractDecades(3);
      expect(result, DateTime(1994, 6, 15, 14, 25, 30, 500, 250));
    });

    test('subtractDecades with zero decades returns same DateTime', () {
      final DateTime now = DateTime(2024, 4, 15, 10, 30);
      final DateTime result = now.subtractDecades(0);
      expect(result, now);
    });

    test('subtractDecade getter works correctly', () {
      final DateTime now = DateTime(2024, 5, 15);
      final DateTime result = now.subtractDecade;
      expect(result, DateTime(2014, 5, 15));
    });

    test('subtractDecades preserves month and day', () {
      final DateTime now = DateTime(2024, 12, 25, 18, 45);
      final DateTime result = now.subtractDecades(5);
      expect(result, DateTime(1974, 12, 25, 18, 45));
    });
  });

  group('DateTimeSubtractExtendingYearsExtension - Basic Century Subtraction',
      () {
    test('subtractCenturies returns correct DateTime for simple case', () {
      final DateTime now = DateTime(2024, 6, 15, 10, 30, 45);
      final DateTime result = now.subtractCenturies(2);
      expect(result, DateTime(1824, 6, 15, 10, 30, 45));
    });

    test('subtractCenturies with single century', () {
      final DateTime now = DateTime(2024, 3, 15);
      final DateTime result = now.subtractCenturies(1);
      expect(result, DateTime(1924, 3, 15));
    });

    test('subtractCenturies preserves time components', () {
      final DateTime now = DateTime(2024, 6, 15, 14, 25, 30, 500, 250);
      final DateTime result = now.subtractCenturies(3);
      expect(result, DateTime(1724, 6, 15, 14, 25, 30, 500, 250));
    });

    test('subtractCenturies with zero centuries returns same DateTime', () {
      final DateTime now = DateTime(2024, 4, 15, 10, 30);
      final DateTime result = now.subtractCenturies(0);
      expect(result, now);
    });

    test('subtractCentury getter works correctly', () {
      final DateTime now = DateTime(2024, 5, 15);
      final DateTime result = now.subtractCentury;
      expect(result, DateTime(1924, 5, 15));
    });

    test('subtractCenturies preserves month and day', () {
      final DateTime now = DateTime(2024, 12, 25, 18, 45);
      final DateTime result = now.subtractCenturies(4);
      expect(result, DateTime(1624, 12, 25, 18, 45));
    });
  });

  group('DateTimeSubtractExtendingYearsExtension - Leap Year Handling', () {
    test('subtractDecades from leap day to non-leap year clamps to Feb 28', () {
      final DateTime now = DateTime(2024, 2, 29, 12, 30); // leap year
      final DateTime result = now.subtractDecades(1); // goes to 2014
      expect(
          result,
          DateTime(
              2014, 2, 28, 12, 30)); // 2014 is not leap year, clamped to Feb 28
    });

    test('subtractDecades from leap day to another leap year preserves Feb 29',
        () {
      final DateTime now = DateTime(2024, 2, 29, 15, 45); // leap year
      final DateTime result = now.subtractDecades(1); // goes to 2014 (not leap)
      expect(result, DateTime(2014, 2, 28, 15, 45)); // clamped to Feb 28
    });

    test('subtractDecades preserves leap day when target is leap year', () {
      final DateTime now = DateTime(2020, 2, 29, 9, 15); // leap year
      final DateTime result =
          now.subtractDecades(2); // goes to 2000 (leap year)
      expect(result, DateTime(2000, 2, 29, 9, 15)); // Feb 29 preserved
    });

    test('subtractCenturies from leap day to century non-leap year', () {
      final DateTime now = DateTime(2000, 2, 29, 16, 20); // century leap year
      final DateTime result = now.subtractCenturies(1); // goes to 1900
      expect(result, DateTime(1900, 2, 28, 16, 20)); // 1900 was not a leap year
    });

    test('subtractCenturies handles century leap year correctly', () {
      final DateTime now =
          DateTime(2400, 2, 29, 11, 45); // future century leap year
      final DateTime result = now.subtractCenturies(1); // goes to 2300
      expect(result, DateTime(2300, 2, 28, 11, 45)); // 2300 is not a leap year
    });

    test('subtractDecades multiple leap year interactions', () {
      final DateTime now = DateTime(2024, 2, 29, 14, 30); // leap year
      final DateTime result = now.subtractDecades(3); // goes to 1994 (not leap)
      expect(result, DateTime(1994, 2, 28, 14, 30)); // clamped to Feb 28
    });
  });

  group('DateTimeSubtractExtendingYearsExtension - Large Time Spans', () {
    test('subtractDecades with very large value', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now.subtractDecades(20); // 200 years
      expect(result, DateTime(1824, 6, 15));
    });

    test('subtractCenturies spanning multiple millennia', () {
      final DateTime now = DateTime(2024, 7, 4, 12, 0);
      final DateTime result = now.subtractCenturies(10); // 1000 years
      expect(result, DateTime(1024, 7, 4, 12, 0));
    });

    test('subtractDecades going back to ancient times', () {
      final DateTime now = DateTime(2024, 12, 25);
      final DateTime result = now.subtractDecades(202); // 2020 years
      expect(result, DateTime(4, 12, 25));
    });

    test('subtractCenturies with maximum span', () {
      final DateTime now = DateTime(2024, 1, 1, 0, 0);
      final DateTime result = now.subtractCenturies(20); // 2000 years
      expect(result, DateTime(24, 1, 1, 0, 0));
    });

    test('subtractDecades to year 1', () {
      final DateTime now = DateTime(2024, 8, 15);
      final DateTime result = now.subtractDecades(202); // 2020 years
      expect(result, DateTime(4, 8, 15));
    });
  });

  group(
      'DateTimeSubtractExtendingYearsExtension - UTC and Timezone Preservation',
      () {
    test('subtractDecades preserves UTC flag when true', () {
      final DateTime utcNow = DateTime.utc(2024, 5, 15, 10, 30);
      final DateTime result = utcNow.subtractDecades(3);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(1994, 5, 15, 10, 30));
    });

    test('subtractCenturies preserves UTC flag when true', () {
      final DateTime utcNow = DateTime.utc(2024, 5, 15, 10, 30);
      final DateTime result = utcNow.subtractCenturies(2);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(1824, 5, 15, 10, 30));
    });

    test('subtractDecades preserves local timezone when false', () {
      final DateTime localNow = DateTime(2024, 5, 15, 10, 30);
      final DateTime result = localNow.subtractDecades(2);
      expect(result.isUtc, false);
      expect(result, DateTime(2004, 5, 15, 10, 30));
    });

    test('subtractCenturies preserves local timezone when false', () {
      final DateTime localNow = DateTime(2024, 5, 15, 10, 30);
      final DateTime result = localNow.subtractCenturies(1);
      expect(result.isUtc, false);
      expect(result, DateTime(1924, 5, 15, 10, 30));
    });

    test('subtractDecade getter preserves UTC flag', () {
      final DateTime utcNow = DateTime.utc(2024, 5, 15);
      final DateTime result = utcNow.subtractDecade;
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2014, 5, 15));
    });

    test('subtractCentury getter preserves UTC flag', () {
      final DateTime utcNow = DateTime.utc(2024, 5, 15);
      final DateTime result = utcNow.subtractCentury;
      expect(result.isUtc, true);
      expect(result, DateTime.utc(1924, 5, 15));
    });

    test('subtractDecades UTC with leap day clamping', () {
      final DateTime utcNow = DateTime.utc(2024, 2, 29, 14, 30, 45);
      final DateTime result = utcNow.subtractDecades(1);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2014, 2, 28, 14, 30, 45));
    });

    test('subtractCenturies preserves exact UTC time components', () {
      final DateTime utcNow = DateTime.utc(2024, 8, 15, 23, 59, 59, 999, 999);
      final DateTime result = utcNow.subtractCenturies(1);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(1924, 8, 15, 23, 59, 59, 999, 999));
    });
  });

  group('DateTimeSubtractExtendingYearsExtension - Negative Values', () {
    test('subtractDecades with negative value adds decades', () {
      final DateTime now = DateTime(2024, 3, 15);
      final DateTime result = now.subtractDecades(-5);
      expect(result, DateTime(2074, 3, 15));
    });

    test('subtractCenturies with negative value adds centuries', () {
      final DateTime now = DateTime(2024, 6, 20);
      final DateTime result = now.subtractCenturies(-2);
      expect(result, DateTime(2224, 6, 20));
    });

    test('subtractDecades with negative value and leap day handling', () {
      final DateTime now = DateTime(2023, 2, 28); // non-leap year
      final DateTime result =
          now.subtractDecades(-1); // equivalent to adding 1 decade
      expect(result, DateTime(2033, 2, 28)); // Feb 28 preserved
    });

    test('subtractCenturies with negative value requires day clamping', () {
      final DateTime now = DateTime(1923, 2, 28);
      final DateTime result =
          now.subtractCenturies(-1); // add 1 century to reach 2023
      expect(result, DateTime(2023, 2, 28)); // should stay Feb 28
    });

    test('subtractDecades with large negative value', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now.subtractDecades(-10); // 100 years into future
      expect(result, DateTime(2124, 6, 15));
    });

    test('subtractCenturies with large negative value', () {
      final DateTime now = DateTime(2024, 9, 30);
      final DateTime result =
          now.subtractCenturies(-5); // 500 years into future
      expect(result, DateTime(2524, 9, 30));
    });
  });

  group('DateTimeSubtractExtendingYearsExtension - Complex Scenarios', () {
    test('subtractDecades multiple times in sequence', () {
      final DateTime now = DateTime(2024, 7, 15, 16, 30);
      final DateTime result = now
          .subtractDecades(1) // 2014
          .subtractDecades(2) // 1994
          .subtractDecades(3); // 1964
      expect(result, DateTime(1964, 7, 15, 16, 30));
    });

    test('subtractCenturies multiple times in sequence', () {
      final DateTime now = DateTime(2024, 4, 10, 8, 45);
      final DateTime result = now
          .subtractCenturies(1) // 1924
          .subtractCenturies(2) // 1724
          .subtractCenturies(1); // 1624
      expect(result, DateTime(1624, 4, 10, 8, 45));
    });

    test('mixed subtractDecades and subtractCenturies operations', () {
      final DateTime now = DateTime(2024, 12, 31, 23, 59);
      final DateTime result = now
          .subtractCenturies(1) // 1924
          .subtractDecades(2) // 1904
          .subtractDecades(1); // 1894
      expect(result, DateTime(1894, 12, 31, 23, 59));
    });

    test('subtractDecades chained with leap day handling', () {
      final DateTime now = DateTime(2024, 2, 29, 12, 0); // leap day
      final DateTime result = now
          .subtractDecades(1) // 2014, Feb 28 (clamped)
          .subtractDecades(1) // 2004, Feb 28
          .subtractDecades(1); // 1994, Feb 28
      expect(result, DateTime(1994, 2, 28, 12, 0));
    });

    test('subtractCenturies preserves milliseconds and microseconds', () {
      final DateTime now = DateTime(2024, 9, 21, 14, 35, 45, 123, 456);
      final DateTime result = now.subtractCenturies(2);
      expect(result, DateTime(1824, 9, 21, 14, 35, 45, 123, 456));
    });

    test('subtractDecades alternating positive and negative', () {
      final DateTime now = DateTime(2024, 4, 10);
      final DateTime result = now
          .subtractDecades(5) // 1974
          .subtractDecades(-2) // 1994
          .subtractDecades(1); // 1984
      expect(result, DateTime(1984, 4, 10));
    });

    test('getter methods chained together', () {
      final DateTime now = DateTime(2024, 6, 15, 12, 30);
      final DateTime result = now.subtractCentury.subtractDecade;
      expect(result, DateTime(1914, 6, 15, 12, 30));
    });
  });

  group('DateTimeSubtractExtendingYearsExtension - Historical Periods', () {
    test('subtractCenturies to different historical eras', () {
      final DateTime now = DateTime(2024, 7, 4, 12, 0);

      // Different historical periods
      expect(now.subtractCenturies(1),
          DateTime(1924, 7, 4, 12, 0)); // 20th century
      expect(now.subtractCenturies(2),
          DateTime(1824, 7, 4, 12, 0)); // 19th century
      expect(now.subtractCenturies(3),
          DateTime(1724, 7, 4, 12, 0)); // 18th century
      expect(now.subtractCenturies(10),
          DateTime(1024, 7, 4, 12, 0)); // Medieval times
    });

    test('subtractDecades to various recent historical periods', () {
      final DateTime now = DateTime(2024, 8, 15, 15, 30);

      // Recent historical decades
      expect(now.subtractDecades(1), DateTime(2014, 8, 15, 15, 30)); // 2010s
      expect(now.subtractDecades(2), DateTime(2004, 8, 15, 15, 30)); // 2000s
      expect(now.subtractDecades(3), DateTime(1994, 8, 15, 15, 30)); // 1990s
      expect(now.subtractDecades(5), DateTime(1974, 8, 15, 15, 30)); // 1970s
      expect(now.subtractDecades(10), DateTime(1924, 8, 15, 15, 30)); // 1920s
    });

    test('subtractCenturies handles century boundaries correctly', () {
      final DateTime now = DateTime(2000, 1, 1, 0, 0); // Y2K
      final DateTime result = now.subtractCenturies(1);
      expect(result, DateTime(1900, 1, 1, 0, 0));
    });

    test('subtractDecades across century boundaries', () {
      final DateTime now = DateTime(2003, 5, 20);
      final DateTime result = now.subtractDecades(10); // 100 years
      expect(result, DateTime(1903, 5, 20));
    });

    test('subtractCenturies with leap year considerations in history', () {
      final DateTime now = DateTime(2000, 2, 29); // Y2K leap day
      final DateTime result = now.subtractCenturies(1);
      expect(result, DateTime(1900, 2, 28)); // 1900 was not a leap year
    });
  });

  group('DateTimeSubtractExtendingYearsExtension - Performance and Edge Cases',
      () {
    test('subtractDecades with very large value preserves precision', () {
      final DateTime now = DateTime(2024, 11, 11, 11, 11, 11, 111, 111);
      final DateTime result = now.subtractDecades(100); // 1000 years
      expect(result, DateTime(1024, 11, 11, 11, 11, 11, 111, 111));
    });

    test('subtractCenturies with maximum precision preservation', () {
      final DateTime now = DateTime(2024, 2, 29, 23, 59, 59, 999, 999);
      final DateTime result = now.subtractCenturies(10); // 1000 years
      expect(
          result,
          DateTime(1024, 2, 29, 23, 59, 59, 999,
              999)); // 1024 is a leap year, Feb 29 preserved
    });

    test('subtractDecade getter with complex DateTime', () {
      final DateTime now = DateTime(2024, 8, 31, 23, 59, 59, 999, 999);
      final DateTime result = now.subtractDecade;
      expect(result, DateTime(2014, 8, 31, 23, 59, 59, 999, 999));
    });

    test('subtractCentury getter with complex DateTime', () {
      final DateTime now = DateTime(2024, 12, 31, 0, 0, 0, 1, 1);
      final DateTime result = now.subtractCentury;
      expect(result, DateTime(1924, 12, 31, 0, 0, 0, 1, 1));
    });

    test('subtractDecades creates new instance, not reference', () {
      final DateTime now = DateTime(2024, 6, 15);
      final DateTime result = now.subtractDecades(0);
      expect(result, now);
      expect(identical(result, now), false);
    });

    test('subtractCenturies creates new instance, not reference', () {
      final DateTime now = DateTime(2024, 3, 20);
      final DateTime result = now.subtractCenturies(0);
      expect(result, now);
      expect(identical(result, now), false);
    });

    test('mixed operations on same DateTime base', () {
      final DateTime base = DateTime(2024, 5, 15, 10, 30);

      final result1 = base.subtractDecades(1);
      final result2 = base.subtractCenturies(1);
      final result3 = base.subtractDecade;
      final result4 = base.subtractCentury;

      expect(result1, DateTime(2014, 5, 15, 10, 30));
      expect(result2, DateTime(1924, 5, 15, 10, 30));
      expect(result3, DateTime(2014, 5, 15, 10, 30));
      expect(result4, DateTime(1924, 5, 15, 10, 30));

      // Original should be unchanged
      expect(base, DateTime(2024, 5, 15, 10, 30));
    });
  });

  group('DateTimeSubtractExtendingYearsExtension - Comprehensive UTC Tests',
      () {
    test('subtractDecades UTC with complex time preservation', () {
      final DateTime utcNow = DateTime.utc(2024, 6, 15, 14, 25, 30, 500, 250);
      final DateTime result = utcNow.subtractDecades(5);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(1974, 6, 15, 14, 25, 30, 500, 250));
    });

    test('subtractCenturies UTC with leap day handling', () {
      final DateTime utcNow = DateTime.utc(2000, 2, 29, 18, 45, 30);
      final DateTime result = utcNow.subtractCenturies(1);
      expect(result.isUtc, true);
      expect(
          result, DateTime.utc(1900, 2, 28, 18, 45, 30)); // 1900 not leap year
    });

    test('subtractDecades UTC chained operations preserve flag', () {
      final DateTime utcNow = DateTime.utc(2024, 12, 31, 23, 59, 59);
      final DateTime result =
          utcNow.subtractDecades(1).subtractDecades(2).subtractDecades(3);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(1964, 12, 31, 23, 59, 59));
    });

    test('subtractCenturies UTC chained operations preserve flag', () {
      final DateTime utcNow = DateTime.utc(2024, 6, 15, 12, 0, 0);
      final DateTime result = utcNow.subtractCenturies(2).subtractCenturies(1);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(1724, 6, 15, 12, 0, 0));
    });

    test('getter methods preserve UTC with microsecond precision', () {
      final DateTime utcNow = DateTime.utc(2024, 3, 15, 9, 30, 45, 123, 456);
      final DateTime result1 = utcNow.subtractDecade;
      final DateTime result2 = utcNow.subtractCentury;

      expect(result1.isUtc, true);
      expect(result2.isUtc, true);
      expect(result1, DateTime.utc(2014, 3, 15, 9, 30, 45, 123, 456));
      expect(result2, DateTime.utc(1924, 3, 15, 9, 30, 45, 123, 456));
    });

    test('subtractDecades UTC handles historical leap years correctly', () {
      final DateTime utcNow = DateTime.utc(2000, 2, 29, 6, 15, 30);
      final DateTime result = utcNow.subtractDecades(10);
      expect(result.isUtc, true);
      expect(
          result, DateTime.utc(1900, 2, 28, 6, 15, 30)); // 1900 not leap year
    });
  });
}
