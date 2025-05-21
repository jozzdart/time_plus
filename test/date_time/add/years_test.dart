import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('YearsRepeatCalculator', () {
    test('Adds years within same century', () {
      final base = DateTime(2024, 5, 20);
      final result = base.addYears(3);
      expect(result, DateTime(2027, 5, 20));
    });

    test('Adds across century boundary', () {
      final base = DateTime(1999, 12, 31);
      final result = base.addYears(2);
      expect(result, DateTime(2001, 12, 31));
    });

    test('Works with zero years (identity)', () {
      final base = DateTime(2024, 5, 10);
      final result = base.addYears(0);
      expect(result, DateTime(2024, 5, 10));
    });

    test('Handles leap year to non-leap year (Feb 29 → Feb 28)', () {
      final base = DateTime(2020, 2, 29); // Leap day
      final result = base.addYears(1);
      expect(result, DateTime(2021, 2, 28)); // Non-leap
    });

    test('Handles non-leap to leap year (Feb 28 → Feb 28)', () {
      final base = DateTime(2023, 2, 28);
      final result = base.addYears(1);
      expect(result, DateTime(2024, 2, 28)); // Still day 28
    });

    test('Preserves end-of-month when possible', () {
      final base = DateTime(2024, 3, 31);
      final result = base.addYears(1);
      expect(result, DateTime(2025, 3, 31));
    });

    test('Handles February 29 repeated in 4-year leap cycle', () {
      final base = DateTime(2020, 2, 29);
      final result = base.addYears(4);
      expect(result, DateTime(2024, 2, 29));
    });

    test('Handles month/day preserved in regular case', () {
      final base = DateTime(2022, 6, 15);
      final result = base.addYears(2);
      expect(result, DateTime(2024, 6, 15));
    });

    test('Handles large year jumps (e.g., 100 years)', () {
      final base = DateTime(1924, 5, 5);
      final result = base.addYears(100);
      expect(result, DateTime(2024, 5, 5));
    });

    test('Handles adding from December 31 to future year', () {
      final base = DateTime(2022, 12, 31);
      final result = base.addYears(5);
      expect(result, DateTime(2027, 12, 31));
    });

    test('isPast returns true if next < now', () {
      final base = DateTime(2000, 1, 1);
      final calc = base.addYears(1);
      expect(calc.isAfter(base), isTrue);
    });

    test('isPast returns false if next > now', () {
      final base = DateTime.now().add(Duration(days: 30));
      final calc = base.addYears(1);
      expect(calc.isAfter(base), isTrue);
    });

    test('Handles year overflow with Feb 29 -> Feb 28 multiple times', () {
      DateTime date = DateTime(2020, 2, 29);
      for (int i = 1; i <= 5; i++) {
        date = date.addYears(1);
      }
      expect(date, DateTime(2025, 2, 28));
    });

    test('Handles negative years (past)', () {
      final base = DateTime(2024, 5, 15);
      final result = base.addYears(-5);
      expect(result, DateTime(2019, 5, 15));
    });

    test('Handles negative leap year (Feb 29 → Feb 28)', () {
      final base = DateTime(2024, 2, 29); // Leap year
      final result = base.addYears(-1);
      expect(result, DateTime(2023, 2, 28)); // Non-leap
    });

    test('Handles multiple leap year hops backward', () {
      DateTime date = DateTime(2024, 2, 29);
      for (int i = 1; i <= 5; i++) {
        date = date.addYears(-1);
      }
      expect(date, DateTime(2019, 2, 28));
    });
  });
}
