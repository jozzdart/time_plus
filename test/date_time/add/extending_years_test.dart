import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DateTimeAddExtendingYearsExtension', () {
    group('addDecades', () {
      test('Adds single decade', () {
        final base = DateTime(2024, 5, 20);
        final result = base.addDecades(1);
        expect(result, DateTime(2034, 5, 20));
      });

      test('Adds multiple decades', () {
        final base = DateTime(2024, 5, 20);
        final result = base.addDecades(3);
        expect(result, DateTime(2054, 5, 20));
      });

      test('Works with zero decades (identity)', () {
        final base = DateTime(2024, 5, 10);
        final result = base.addDecades(0);
        expect(result, DateTime(2024, 5, 10));
      });

      test('Handles leap year to non-leap year (Feb 29 → Feb 28)', () {
        final base = DateTime(2020, 2, 29); // Leap day
        final result = base.addDecades(1);
        expect(result, DateTime(2030, 2, 28)); // Non-leap
      });

      test('Handles century boundary', () {
        final base = DateTime(1995, 12, 31);
        final result = base.addDecades(1);
        expect(result, DateTime(2005, 12, 31));
      });

      test('Handles negative decades (past)', () {
        final base = DateTime(2024, 5, 15);
        final result = base.addDecades(-2);
        expect(result, DateTime(2004, 5, 15));
      });
    });

    group('addCenturies', () {
      test('Adds single century', () {
        final base = DateTime(2024, 5, 20);
        final result = base.addCenturies(1);
        expect(result, DateTime(2124, 5, 20));
      });

      test('Adds multiple centuries', () {
        final base = DateTime(2024, 5, 20);
        final result = base.addCenturies(3);
        expect(result, DateTime(2324, 5, 20));
      });

      test('Works with zero centuries (identity)', () {
        final base = DateTime(2024, 5, 10);
        final result = base.addCenturies(0);
        expect(result, DateTime(2024, 5, 10));
      });

      test('Handles leap year to non-leap year (Feb 29 → Feb 28)', () {
        final base = DateTime(2020, 2, 29); // Leap day
        final result = base.addCentury.addYear;
        expect(result, DateTime(2121, 2, 28)); // Non-leap
      });

      test('Handles millennium boundary', () {
        final base = DateTime(1995, 12, 31);
        final result = base.addCenturies(1);
        expect(result, DateTime(2095, 12, 31));
      });

      test('Handles negative centuries (past)', () {
        final base = DateTime(2024, 5, 15);
        final result = base.addCenturies(-2);
        expect(result, DateTime(1824, 5, 15));
      });
    });

    group('Getter shortcuts', () {
      test('addDecade adds exactly one decade', () {
        final base = DateTime(2024, 5, 20);
        final result = base.addDecade;
        expect(result, DateTime(2034, 5, 20));
      });

      test('addCentury adds exactly one century', () {
        final base = DateTime(2024, 5, 20);
        final result = base.addCentury;
        expect(result, DateTime(2124, 5, 20));
      });

      test('addDecade preserves leap year handling', () {
        final base = DateTime(2020, 2, 29); // Leap day
        final result = base.addDecade;
        expect(result, DateTime(2030, 2, 28)); // Non-leap
      });

      test('addCentury preserves leap year handling', () {
        final base = DateTime(2020, 2, 29);
        final result = base.addCentury;
        expect(result, DateTime(2120, 2, 29));
      });
    });
  });
}
