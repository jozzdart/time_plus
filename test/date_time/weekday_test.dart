import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DateTime weekday extensions', () {
    group('yesterday', () {
      test('returns previous day at start of day', () {
        final date = DateTime(2024, 3, 15, 14, 30, 45);
        final expected = DateTime(2024, 3, 14, 0, 0, 0);
        expect(date.yesterday, equals(expected));
      });

      test('handles month boundary', () {
        final date = DateTime(2024, 3, 1, 0, 0, 0);
        final expected = DateTime(2024, 2, 29, 0, 0, 0); // Leap year
        expect(date.yesterday, equals(expected));
      });

      test('handles year boundary', () {
        final date = DateTime(2024, 1, 1, 0, 0, 0);
        final expected = DateTime(2023, 12, 31, 0, 0, 0);
        expect(date.yesterday, equals(expected));
      });

      test('handles leap year transition', () {
        final date = DateTime(2024, 3, 1, 0, 0, 0);
        final expected = DateTime(2024, 2, 29, 0, 0, 0);
        expect(date.yesterday, equals(expected));
      });

      test('handles non-leap year transition', () {
        final date = DateTime(2023, 3, 1, 0, 0, 0);
        final expected = DateTime(2023, 2, 28, 0, 0, 0);
        expect(date.yesterday, equals(expected));
      });
    });

    group('tomorrow', () {
      test('returns next day at start of day', () {
        final date = DateTime(2024, 3, 15, 14, 30, 45);
        final expected = DateTime(2024, 3, 16, 0, 0, 0);
        expect(date.tomorrow, equals(expected));
      });

      test('handles month boundary', () {
        final date = DateTime(2024, 3, 31, 23, 59, 59);
        final expected = DateTime(2024, 4, 1, 0, 0, 0);
        expect(date.tomorrow, equals(expected));
      });

      test('handles year boundary', () {
        final date = DateTime(2023, 12, 31, 23, 59, 59);
        final expected = DateTime(2024, 1, 1, 0, 0, 0);
        expect(date.tomorrow, equals(expected));
      });

      test('handles leap year transition', () {
        final date = DateTime(2024, 2, 29, 23, 59, 59);
        final expected = DateTime(2024, 3, 1, 0, 0, 0);
        expect(date.tomorrow, equals(expected));
      });

      test('handles non-leap year transition', () {
        final date = DateTime(2023, 2, 28, 23, 59, 59);
        final expected = DateTime(2023, 3, 1, 0, 0, 0);
        expect(date.tomorrow, equals(expected));
      });
    });

    group('nextWeekday', () {
      test('returns correct weekday for next day', () {
        final monday = DateTime(2024, 3, 18); // Monday
        expect(monday.nextWeekday, equals(2)); // Tuesday

        final friday = DateTime(2024, 3, 22); // Friday
        expect(friday.nextWeekday, equals(6)); // Saturday

        final sunday = DateTime(2024, 3, 24); // Sunday
        expect(sunday.nextWeekday, equals(1)); // Monday
      });

      test('handles month boundary', () {
        final lastDayOfMonth = DateTime(2024, 3, 31); // Sunday
        expect(lastDayOfMonth.nextWeekday, equals(1)); // Monday
      });

      test('handles year boundary', () {
        final lastDayOfYear = DateTime(2023, 12, 31); // Sunday
        expect(lastDayOfYear.nextWeekday, equals(1)); // Monday
      });

      test('handles leap year transition', () {
        final leapDay = DateTime(2024, 2, 29); // Thursday
        expect(leapDay.nextWeekday, equals(5)); // Friday
      });
    });

    group('previousWeekday', () {
      test('returns correct weekday for previous day', () {
        final tuesday = DateTime.utc(2024, 3, 19); // Tuesday
        expect(tuesday.previousWeekday, equals(1)); // Monday

        final monday = DateTime.utc(2024, 3, 18); // Monday
        expect(monday.previousWeekday, equals(7)); // Sunday

        final saturday = DateTime.utc(2024, 3, 23); // Saturday

        print(saturday); // Should be 2024-03-23
        print(saturday.yesterday); // Should be 2024-03-22
        print(saturday.yesterday.weekday); // Should be 5

        expect(saturday.previousWeekday, equals(5)); // Friday
      });

      test('handles month boundary', () {
        final firstDayOfMonth = DateTime.utc(2024, 4, 1); // Monday
        expect(firstDayOfMonth.previousWeekday, equals(7)); // Sunday
      });

      test('handles year boundary', () {
        final firstDayOfYear = DateTime.utc(2024, 1, 1); // Monday
        expect(firstDayOfYear.previousWeekday, equals(7)); // Sunday
      });

      test('handles leap year transition', () {
        final dayAfterLeap = DateTime.utc(2024, 3, 1); // Friday
        expect(dayAfterLeap.previousWeekday, equals(4)); // Thursday
      });
    });

    group('Edge cases', () {
      test('handles timezone changes', () {
        final date = DateTime.utc(2024, 3, 15, 14, 30, 45);
        final expectedYesterday = DateTime.utc(2024, 3, 14, 0, 0, 0);
        final expectedTomorrow = DateTime.utc(2024, 3, 16, 0, 0, 0);

        expect(date.yesterday, equals(expectedYesterday));
        expect(date.tomorrow, equals(expectedTomorrow));
      });

      test('handles daylight saving time transitions', () {
        // Spring forward (March 10, 2024)
        final beforeDST = DateTime(2024, 3, 10, 1, 59, 59);
        final afterDST = DateTime(2024, 3, 10, 3, 0, 0);

        expect(beforeDST.yesterday, equals(DateTime(2024, 3, 9, 0, 0, 0)));
        expect(afterDST.yesterday, equals(DateTime(2024, 3, 9, 0, 0, 0)));

        expect(beforeDST.tomorrow, equals(DateTime(2024, 3, 11, 0, 0, 0)));
        expect(afterDST.tomorrow, equals(DateTime(2024, 3, 11, 0, 0, 0)));

        // Fall back (November 3, 2024)
        final beforeFallBack = DateTime(2024, 11, 3, 1, 59, 59);
        final afterFallBack = DateTime(2024, 11, 3, 1, 0, 0);

        expect(
            beforeFallBack.yesterday, equals(DateTime(2024, 11, 2, 0, 0, 0)));
        expect(afterFallBack.yesterday, equals(DateTime(2024, 11, 2, 0, 0, 0)));

        expect(beforeFallBack.tomorrow, equals(DateTime(2024, 11, 4, 0, 0, 0)));
        expect(afterFallBack.tomorrow, equals(DateTime(2024, 11, 4, 0, 0, 0)));
      });

      test('handles week transitions consistently', () {
        // Test a full week cycle
        final monday = DateTime.utc(2024, 3, 18); // Monday
        final tuesday = DateTime.utc(2024, 3, 19); // Tuesday
        final wednesday = DateTime.utc(2024, 3, 20); // Wednesday
        final thursday = DateTime.utc(2024, 3, 21); // Thursday
        final friday = DateTime.utc(2024, 3, 22); // Friday
        final saturday = DateTime.utc(2024, 3, 23); // Saturday
        final sunday = DateTime.utc(2024, 3, 24); // Sunday

        // Test nextWeekday
        expect(monday.nextWeekday, equals(2)); // Tuesday
        expect(tuesday.nextWeekday, equals(3)); // Wednesday
        expect(wednesday.nextWeekday, equals(4)); // Thursday
        expect(thursday.nextWeekday, equals(5)); // Friday
        expect(friday.nextWeekday, equals(6)); // Saturday
        expect(saturday.nextWeekday, equals(7)); // Sunday
        expect(sunday.nextWeekday, equals(1)); // Monday

        // Test previousWeekday
        expect(monday.previousWeekday, equals(7)); // Sunday
        expect(tuesday.previousWeekday, equals(1)); // Monday
        expect(wednesday.previousWeekday, equals(2)); // Tuesday
        expect(thursday.previousWeekday, equals(3)); // Wednesday
        expect(friday.previousWeekday, equals(4)); // Thursday
        expect(saturday.previousWeekday, equals(5)); // Friday
        expect(sunday.previousWeekday, equals(6)); // Saturday
      });
    });
  });
}
