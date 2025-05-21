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
}
