import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart'; // Adjust path if needed

void main() {
  group('DateTimeNextExtensions - nextTimeOfDay', () {
    test('returns later time today if still in the future', () {
      final now = DateTime(2024, 4, 20, 10, 0);
      final result = now.nextTimeOfDay(hour: 11);
      expect(result, DateTime(2024, 4, 20, 11));
    });

    test('returns tomorrow if time already passed today', () {
      final now = DateTime(2024, 4, 20, 14, 0);
      final result = now.nextTimeOfDay(hour: 10);
      expect(result, DateTime(2024, 4, 21, 10));
    });

    test('returns tomorrow if same time today', () {
      final now = DateTime(2024, 4, 20, 10, 0);
      final result = now.nextTimeOfDay(hour: 10);
      expect(result, DateTime(2024, 4, 21, 10));
    });

    test('preserves milliseconds and microseconds', () {
      final now = DateTime(2024, 4, 20, 9, 0);
      final result = now.nextTimeOfDay(
        hour: 10,
        minute: 15,
        second: 30,
        millisecond: 500,
        microsecond: 250,
      );
      expect(
        result,
        DateTime(2024, 4, 20, 10, 15, 30, 500, 250),
      );
    });

    test('preserves time zone (UTC)', () {
      final now = DateTime.utc(2024, 4, 20, 23, 0);
      final result = now.nextTimeOfDay(hour: 22);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2024, 4, 21, 22));
    });

    test('handles midnight transition correctly', () {
      final now = DateTime(2024, 4, 20, 23, 59, 59);
      final result = now.nextTimeOfDay(hour: 0);
      expect(result, DateTime(2024, 4, 21, 0));
    });

    test('handles month transition correctly', () {
      final now = DateTime(2024, 4, 30, 23, 0);
      final result = now.nextTimeOfDay(hour: 1);
      expect(result, DateTime(2024, 5, 1, 1));
    });

    test('handles year transition correctly', () {
      final now = DateTime(2024, 12, 31, 23, 0);
      final result = now.nextTimeOfDay(hour: 1);
      expect(result, DateTime(2025, 1, 1, 1));
    });

    test('handles leap year transition correctly', () {
      final now = DateTime(2024, 2, 28, 23, 0);
      final result = now.nextTimeOfDay(hour: 1);
      expect(result, DateTime(2024, 2, 29, 1));
    });

    test('handles different time zones consistently', () {
      final now = DateTime(2024, 4, 20, 10, 0).toLocal();
      final result = now.nextTimeOfDay(hour: 11);
      expect(result.isUtc, now.isUtc);
      expect(result.hour, 11);
    });

    test('handles edge case of 23:59:59.999999', () {
      final now = DateTime(2024, 4, 20, 23, 59, 59, 999, 999);
      final result = now.nextTimeOfDay(hour: 0);
      expect(result, DateTime(2024, 4, 21, 0));
    });

    test('handles complex time combinations', () {
      final now = DateTime(2024, 4, 20, 15, 30, 45, 123, 456);
      final result = now.nextTimeOfDay(
        hour: 16,
        minute: 45,
        second: 30,
        millisecond: 789,
        microsecond: 123,
      );
      expect(
        result,
        DateTime(2024, 4, 20, 16, 45, 30, 789, 123),
      );
    });

    test('handles DST spring forward transition', () {
      final now = DateTime(2024, 3, 10, 1, 30); // During DST transition
      final result = now.nextTimeOfDay(hour: 2);
      expect(result, DateTime(2024, 3, 10, 2));
    });

    test('handles DST fall back transition', () {
      final now = DateTime(2024, 11, 3, 1, 30); // During DST transition
      final result = now.nextTimeOfDay(hour: 2);
      expect(result, DateTime(2024, 11, 3, 2));
    });

    test('handles time precision edge cases', () {
      final now = DateTime(2024, 4, 20, 23, 59, 59, 999, 999);
      final result = now.nextTimeOfDay(
        hour: 23,
        minute: 59,
        second: 59,
        millisecond: 999,
        microsecond: 999,
      );
      expect(result, DateTime(2024, 4, 21, 23, 59, 59, 999, 999));
    });

    test('handles time zone offset changes', () {
      final now = DateTime(2024, 4, 20, 10, 0).toLocal();
      final result = now.nextTimeOfDay(hour: 11);
      expect(result.timeZoneOffset, now.timeZoneOffset);
    });

    test('handles time zone name preservation', () {
      final now = DateTime(2024, 4, 20, 10, 0).toLocal();
      final result = now.nextTimeOfDay(hour: 11);
      expect(result.timeZoneName, now.timeZoneName);
    });
  });

  group('DateTimeNextExtensions - nextWeekdayTime', () {
    test('returns next weekday if in future this week', () {
      final saturday = DateTime(2024, 4, 20); // Saturday
      final nextMonday = saturday.nextWeekdayTime(DateTime.monday);
      expect(nextMonday, DateTime(2024, 4, 22));
    });

    test('returns weekday with specific time', () {
      final saturday = DateTime(2024, 4, 20);
      final nextMonday = saturday.nextWeekdayTime(DateTime.monday, hour: 9);
      expect(nextMonday, DateTime(2024, 4, 22, 9));
    });

    test('wraps around when weekday is today (skips 7 days)', () {
      final monday = DateTime(2024, 4, 22); // Monday
      final nextMonday = monday.nextWeekdayTime(DateTime.monday, hour: 8);
      expect(nextMonday, DateTime(2024, 4, 29, 8));
    });

    test('works for all weekdays', () {
      final base = DateTime(2024, 4, 20); // Saturday
      final expected = {
        DateTime.sunday: DateTime(2024, 4, 21),
        DateTime.monday: DateTime(2024, 4, 22),
        DateTime.tuesday: DateTime(2024, 4, 23),
        DateTime.wednesday: DateTime(2024, 4, 24),
        DateTime.thursday: DateTime(2024, 4, 25),
        DateTime.friday: DateTime(2024, 4, 26),
        DateTime.saturday: DateTime(2024, 4, 27),
      };

      expected.forEach((weekday, expectedDate) {
        final result = base.nextWeekdayTime(weekday);
        expect(result, expectedDate);
      });
    });

    test('handles leap year date and rolls over', () {
      final leapDay = DateTime(2024, 2, 29); // Thursday
      final nextThursday = leapDay.nextWeekdayTime(DateTime.thursday, hour: 12);
      expect(nextThursday, DateTime(2024, 3, 7, 12));
    });

    test('preserves time zone (UTC)', () {
      final now = DateTime.utc(2024, 4, 20);
      final result = now.nextWeekdayTime(DateTime.monday, hour: 15);
      expect(result.isUtc, true);
      expect(result, DateTime.utc(2024, 4, 22, 15));
    });

    test('includes milliseconds and microseconds', () {
      final now = DateTime(2024, 4, 20); // Saturday
      final result = now.nextWeekdayTime(
        DateTime.sunday,
        hour: 6,
        minute: 30,
        second: 15,
        millisecond: 123,
        microsecond: 456,
      );
      expect(result, DateTime(2024, 4, 21, 6, 30, 15, 123, 456));
    });

    test('handles month transition correctly', () {
      final now = DateTime(2024, 4, 30); // Tuesday
      final result = now.nextWeekdayTime(DateTime.wednesday);
      expect(result, DateTime(2024, 5, 1));
    });

    test('handles year transition correctly', () {
      final now = DateTime(2024, 12, 31); // Tuesday
      final result = now.nextWeekdayTime(DateTime.wednesday);
      expect(result, DateTime(2025, 1, 1));
    });

    test('handles different time zones consistently', () {
      final now = DateTime(2024, 4, 20).toLocal();
      final result = now.nextWeekdayTime(DateTime.monday, hour: 9);
      expect(result.isUtc, now.isUtc);
      expect(result.hour, 9);
    });

    test('handles edge case of last day of month', () {
      final now = DateTime(2024, 4, 30, 23, 59, 59, 999, 999);
      final result = now.nextWeekdayTime(DateTime.wednesday);
      expect(result, DateTime(2024, 5, 1));
    });

    test('handles multiple week skips correctly', () {
      final now = DateTime(2024, 4, 20); // Saturday
      final result = now.nextWeekdayTime(DateTime.saturday, hour: 15);
      expect(result, DateTime(2024, 4, 27, 15));
    });

    test('handles time zone changes during DST', () {
      final now = DateTime(2024, 3, 9); // Saturday before DST
      final result = now.nextWeekdayTime(DateTime.monday, hour: 2);
      expect(result, DateTime(2024, 3, 11, 2));
    });

    test('handles complex time combinations with weekdays', () {
      final now = DateTime(2024, 4, 20, 15, 30, 45, 123, 456);
      final result = now.nextWeekdayTime(
        DateTime.monday,
        hour: 16,
        minute: 45,
        second: 30,
        millisecond: 789,
        microsecond: 123,
      );
      expect(
        result,
        DateTime(2024, 4, 22, 16, 45, 30, 789, 123),
      );
    });

    test('handles DST spring forward with weekday transition', () {
      final now = DateTime(2024, 3, 9, 1, 30); // Saturday before DST
      final result = now.nextWeekdayTime(DateTime.monday, hour: 2);
      expect(result, DateTime(2024, 3, 11, 2));
    });

    test('handles DST fall back with weekday transition', () {
      final now = DateTime(2024, 11, 2, 1, 30); // Saturday before DST
      final result = now.nextWeekdayTime(DateTime.monday, hour: 2);
      expect(result, DateTime(2024, 11, 4, 2));
    });

    test('handles time precision edge cases with weekdays', () {
      final now = DateTime(2024, 4, 20, 23, 59, 59, 999, 999);
      final result = now.nextWeekdayTime(
        DateTime.monday,
        hour: 23,
        minute: 59,
        second: 59,
        millisecond: 999,
        microsecond: 999,
      );
      expect(result, DateTime(2024, 4, 22, 23, 59, 59, 999, 999));
    });

    test('handles time zone offset changes with weekdays', () {
      final now = DateTime(2024, 4, 20, 10, 0).toLocal();
      final result = now.nextWeekdayTime(DateTime.monday, hour: 11);
      expect(result.timeZoneOffset, now.timeZoneOffset);
    });

    test('handles time zone name preservation with weekdays', () {
      final now = DateTime(2024, 4, 20, 10, 0).toLocal();
      final result = now.nextWeekdayTime(DateTime.monday, hour: 11);
      expect(result.timeZoneName, now.timeZoneName);
    });

    test('handles multiple month transitions with weekdays', () {
      final now = DateTime(2024, 4, 30); // Tuesday
      final result = now.nextWeekdayTime(DateTime.wednesday, hour: 15);
      expect(result, DateTime(2024, 5, 1, 15));
    });

    test('handles multiple year transitions with weekdays', () {
      final now = DateTime(2024, 12, 31); // Tuesday
      final result = now.nextWeekdayTime(DateTime.wednesday, hour: 15);
      expect(result, DateTime(2025, 1, 1, 15));
    });

    test('handles leap year transitions with weekdays', () {
      final now = DateTime(2024, 2, 28); // Wednesday
      final result = now.nextWeekdayTime(DateTime.thursday, hour: 15);
      expect(result, DateTime(2024, 2, 29, 15));
    });

    test('handles week transitions with specific times', () {
      final now = DateTime(2024, 4, 20, 15, 30); // Saturday
      final result =
          now.nextWeekdayTime(DateTime.saturday, hour: 16, minute: 45);
      expect(result, DateTime(2024, 4, 27, 16, 45));
    });
  });
}
