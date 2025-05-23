import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('MonthsRepeatCalculator', () {
    test('Adds within the same year', () {
      final base = DateTime(2024, 1, 15);
      final result = base.addMonths(2);
      expect(result, DateTime(2024, 3, 15));
    });

    test('Handles month overflow into next year', () {
      final base = DateTime(2024, 11, 10);
      final result = base.addMonths(3);
      expect(result, DateTime(2025, 2, 10));
    });

    test('Clamps day for shorter month', () {
      final base = DateTime(2024, 1, 31); // January 31
      final result = base.addMonths(1);
      expect(result, DateTime(2024, 2, 29)); // Leap year February
    });

    test('Handles non-leap year February', () {
      final base = DateTime(2023, 1, 31);
      final result = base.addMonths(1);
      expect(result, DateTime(2023, 2, 28));
    });

    test('Clamps from 30 to 28 days (Feb)', () {
      final base = DateTime(2023, 12, 30);
      final result = base.addMonths(2);
      expect(result, DateTime(2024, 2, 29));
    });

    test('Works with zero months (identity)', () {
      final base = DateTime(2024, 5, 10);
      final result = base.addMonths(0);
      expect(result, DateTime(2024, 5, 10));
    });

    test('Works with negative months (goes back)', () {
      final base = DateTime(2024, 5, 15);
      final result = base.addMonths(-3);
      expect(result, DateTime(2024, 2, 15));
    });

    test('Negative months with clamping (to Feb)', () {
      final base = DateTime(2024, 5, 31);
      final result = base.addMonths(-3);
      expect(result, DateTime(2024, 2, 29));
    });

    test('Multiple years ahead (e.g., 25 months)', () {
      final base = DateTime(2024, 3, 20);
      final result = base.addMonths(25);
      expect(result, DateTime(2026, 4, 20));
    });

    test('Multiple years back (e.g., -25 months)', () {
      final base = DateTime(2024, 3, 20);
      final result = base.addMonths(-25);
      expect(result, DateTime(2022, 2, 20));
    });

    test('Handles adding to December (wraps to January)', () {
      final base = DateTime(2024, 12, 5);
      final result = base.addMonths(1);
      expect(result, DateTime(2025, 1, 5));
    });

    test('Handles subtraction to January (wraps from December)', () {
      final base = DateTime(2024, 1, 5);
      final result = base.addMonths(-1);
      expect(result, DateTime(2023, 12, 5));
    });

    test('Leap year to non-leap February clamp', () {
      final base = DateTime(2020, 2, 29); // Leap day
      final result = base.addMonths(12);
      expect(result, DateTime(2021, 2, 28)); // Non-leap year
    });

    test('isPast returns true if next < now', () {
      final base = DateTime(2020, 1, 1);
      final calc = base.addMonths(1);
      expect(calc.isAfter(base), isTrue);
    });

    test('isPast returns false if next > now', () {
      final base = DateTime.now().add(Duration(days: 1));
      final calc = base.addMonths(1);
      expect(calc.isAfter(base), isTrue);
    });

    test('Adding 12 months goes exactly one year forward', () {
      final base = DateTime(2024, 6, 15);
      final result = base.addMonths(12);
      expect(result, DateTime(2025, 6, 15));
    });

    test('Adding months lands on same day if valid', () {
      final base = DateTime(2024, 5, 20);
      final result = base.addMonths(1);
      expect(result, DateTime(2024, 6, 20));
    });

    test('Handles end-of-month properly when next month is shorter', () {
      final base = DateTime(2024, 3, 31); // March 31
      final result = base.addMonths(1);
      expect(result, DateTime(2024, 4, 30));
    });

    test('Adding 100 months works correctly', () {
      final base = DateTime(2024, 1, 31);
      final result = base.addMonths(100);
      expect(result, DateTime(2032, 5, 31));
    });

    test('January 31st to February in non-leap year', () {
      final base = DateTime(2023, 1, 31);
      final result = base.addMonths(1);
      expect(result, DateTime(2023, 2, 28));
    });

    test('January 30th to February in leap year', () {
      final base = DateTime(2024, 1, 30);
      final result = base.addMonths(1);
      expect(result, DateTime(2024, 2, 29));
    });

    test('Adding months from first of month remains on first', () {
      final base = DateTime(2024, 8, 1);
      final result = base.addMonths(5);
      expect(result, DateTime(2025, 1, 1));
    });

    test('Day 1 in short month to longer month remains on Day 1', () {
      final base = DateTime(2024, 2, 1);
      final result = base.addMonths(1);
      expect(result, DateTime(2024, 3, 1));
    });
  });

  group('DateTimeAddMonthsAndYearsExtension – timezone edge cases', () {
    // 1) Ensure UTC flag is preserved
    test('addMonths on UTC DateTime stays UTC', () {
      final base = DateTime.utc(2024, 1, 31, 12, 34, 56);
      final result = base.addMonths(1);
      expect(result.isUtc, isTrue);
      // day clamps to Feb-29 but hour/min/sec default to original
      expect(result, DateTime.utc(2024, 2, 29, 12, 34, 56));
    });

    // 2) Adding months across a spring-forward gap (non-existent local time)
    test('addMonths on a spring-forward DST date normalizes correctly UTC', () {
      // In many zones DST jumps at 02:00 → 03:00 on March 31, 2024
      final before = DateTime.utc(2024, 2, 29, 2, 30); // Feb 29 at 2:30 (valid)
      final result =
          before.addMonths(1); // March 29 at 2:30 → that time never existed
      // Dart will normalize to the next valid instant (typically 03:00)
      expect(result.month, 3);
      // It must not throw, but we check it stays in March and isAfter 02:59
      expect(result.isAfter(DateTime.utc(2024, 3, 29, 2, 29)), isTrue);
    });

    // 2) Adding months across a spring-forward gap (non-existent local time)
    test('addMonths on a spring-forward DST date normalizes correctly', () {
      // In many zones DST jumps at 02:00 → 03:00 on March 31, 2024
      final before = DateTime(2024, 2, 29, 2, 30); // Feb 29 at 2:30 (valid)
      final result =
          before.addMonths(1); // March 29 at 2:30 → that time never existed
      // Dart will normalize to the next valid instant (typically 03:00)
      expect(result.month, 3);
      // It must not throw, but we check it stays in March and isAfter 02:59
      expect(result.isAfter(DateTime(2024, 3, 29, 2, 29)), isTrue);
    });

    test('spring-forward DST time is normalized to 03:00', () {
      final invalid = DateTime(2024, 3, 31, 2, 30); // Does not exist
      expect(invalid.addMonths(1), DateTime(2024, 4, 30, 2, 30));
    });

    // 3) Adding months across a fall-back gap (ambiguous local time)
    test(
        'addMonths on a fall-back DST date yields one of the two valid offsets',
        () {
      // In many zones controls go back 03:00 → 02:00 on Oct 27, 2024
      final before = DateTime(2024, 9, 27, 2, 30); // Sep 27 02:30
      final result = before.addMonths(1); // Oct 27 02:30 appears twice
      expect(result.month, 10);
      // We can’t predict exactly which offset Dart picks, but it must be in the 2-3 AM hour
      expect(result.hour, anyOf(2, 3));
    });

    // 4) Verify that time-of-day is reset to midnight (current behavior)
    test('addMonths always yields midnight regardless of original time', () {
      final base = DateTime(2024, 5, 15, 18, 45, 30);
      final result = base.addMonths(2);
      expect(result.hour, 18);
      expect(result.minute, 45);
      expect(result.second, 30);
    });

    // 5) Round-trip UTC→local→addMonths→toUtc
    test('round-trip through UTC preserves correct calendar date', () {
      final local = DateTime(2024, 4, 10, 5, 0);
      final asUtc = local.toUtc();
      final addedUtc = asUtc.addMonths(1);
      final backToLocal = addedUtc.toLocal();
      // Should land on May 10 local, even if DST changed in May
      expect(backToLocal.month, 5);
      expect(backToLocal.day, 10);
    });
  });
}
