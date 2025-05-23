import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DateTimeSubtractDurationsExtensions - Explicit Methods', () {
    test('subtractMilliseconds returns correct DateTime', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30, 45, 500);
      final DateTime result = now.subtractMilliseconds(200);
      expect(result, DateTime(2024, 4, 20, 10, 30, 45, 300));
    });

    test('subtractMilliseconds with large value rolls back seconds', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30, 45, 500);
      final DateTime result = now.subtractMilliseconds(1500);
      expect(result, DateTime(2024, 4, 20, 10, 30, 44, 0));
    });

    test('subtractSeconds returns correct DateTime', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30, 45);
      final DateTime result = now.subtractSeconds(15);
      expect(result, DateTime(2024, 4, 20, 10, 30, 30));
    });

    test('subtractSeconds with large value rolls back minutes', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30, 45);
      final DateTime result = now.subtractSeconds(75);
      expect(result, DateTime(2024, 4, 20, 10, 29, 30));
    });

    test('subtractMinutes returns correct DateTime', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30);
      final DateTime result = now.subtractMinutes(15);
      expect(result, DateTime(2024, 4, 20, 10, 15));
    });

    test('subtractMinutes with large value rolls back hours', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30);
      final DateTime result = now.subtractMinutes(75);
      expect(result, DateTime(2024, 4, 20, 9, 15));
    });

    test('subtractHours returns correct DateTime', () {
      final DateTime now = DateTime(2024, 4, 20, 10);
      final DateTime result = now.subtractHours(5);
      expect(result, DateTime(2024, 4, 20, 5));
    });

    test('subtractHours with large value rolls back days', () {
      final DateTime now = DateTime(2024, 4, 20, 10);
      final DateTime result = now.subtractHours(25);
      expect(result, DateTime(2024, 4, 19, 9));
    });

    test('subtractDays returns correct DateTime', () {
      final DateTime now = DateTime(2024, 4, 20);
      final DateTime result = now.subtractDays(5);
      expect(result, DateTime(2024, 4, 15));
    });

    test('subtractDays in UTC always rolls back N×24h', () {
      final now = DateTime(2024, 4, 20, 0, 0);
      final result = now.subtractDays(35);
      expect(result, DateTime(2024, 3, 16, 0, 0));
    });

    test('subtractDays', () {
      final now = DateTime(2024, 4, 20);
      final result = now.subtractDays(35);
      expect(result, DateTime(2024, 3, 16));
    });

    test('subtractWeeks returns correct DateTime', () {
      final DateTime now = DateTime(2024, 4, 20);
      final DateTime result = now.subtractWeeks(2);
      expect(result, DateTime(2024, 4, 6));
    });

    test('subtractWeeks with large value rolls back months and years', () {
      final DateTime now = DateTime(2024, 1, 20);
      final DateTime result = now.subtractWeeks(8);
      expect(result, DateTime(2023, 11, 25));
    });
  });

  group('DateTimeSubtractDurationsExtensions - Edge Cases', () {
    test('subtractDays handles month boundaries correctly', () {
      final DateTime start = DateTime(2024, 5, 1);
      final DateTime result = start.subtractDays(1);
      expect(result, DateTime(2024, 4, 30));
    });

    test('subtractDays handles leap year correctly', () {
      final DateTime start = DateTime(2024, 3, 1); // 2024 is a leap year
      final DateTime result = start.subtractDays(1);
      expect(result, DateTime(2024, 2, 29));
    });

    test('subtractDays handles non-leap year correctly', () {
      final DateTime start = DateTime(2023, 3, 1); // 2023 is not a leap year
      final DateTime result = start.subtractDays(1);
      expect(result, DateTime(2023, 2, 28));
    });

    test('subtractDays handles year boundaries correctly', () {
      final DateTime start = DateTime(2024, 1, 1);
      final DateTime result = start.subtractDays(1);
      expect(result, DateTime(2023, 12, 31));
    });

    test('subtractMilliseconds with zero value returns same DateTime', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30, 45, 500);
      final DateTime result = now.subtractMilliseconds(0);
      expect(result, now);
    });

    test('subtractMilliseconds preserves microseconds', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30, 45, 500, 250);
      final DateTime result = now.subtractMilliseconds(200);
      expect(result, DateTime(2024, 4, 20, 10, 30, 45, 300, 250));
    });

    test('subtractMilliseconds preserves timezone', () {
      final DateTime utcNow = DateTime.utc(2024, 4, 20, 10, 30);
      final DateTime result = utcNow.subtractMilliseconds(500);
      expect(result.isUtc, true);
    });
  });

  group('DateTimeSubtractDurationsExtensions - Getter Methods', () {
    test('subtractMillisecond works correctly', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30, 45, 500);
      final DateTime result = now.subtractMillisecond;
      expect(result, DateTime(2024, 4, 20, 10, 30, 45, 499));
    });

    test('subtractSecond works correctly', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30, 45);
      final DateTime result = now.subtractSecond;
      expect(result, DateTime(2024, 4, 20, 10, 30, 44));
    });

    test('subtractMinute works correctly', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30);
      final DateTime result = now.subtractMinute;
      expect(result, DateTime(2024, 4, 20, 10, 29));
    });

    test('subtractHour works correctly', () {
      final DateTime now = DateTime(2024, 4, 20, 10);
      final DateTime result = now.subtractHour;
      expect(result, DateTime(2024, 4, 20, 9));
    });

    test('subtractDay works correctly', () {
      final DateTime now = DateTime(2024, 4, 20);
      final DateTime result = now.subtractDay;
      expect(result, DateTime(2024, 4, 19));
    });

    test('subtractWeek works correctly', () {
      final DateTime now = DateTime(2024, 4, 20);
      final DateTime result = now.subtractWeek;
      expect(result, DateTime(2024, 4, 13));
    });
  });

  group('DateTimeSubtractDurationsExtensions - Chaining Methods', () {
    test('chaining multiple subtractions works correctly', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30, 45);
      final DateTime result = now
          .subtractDays(1)
          .subtractHours(2)
          .subtractMinutes(15)
          .subtractSeconds(30);
      expect(result, DateTime(2024, 4, 19, 8, 15, 15));
    });

    test('chaining getter methods works correctly', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30, 45);
      final DateTime result = now.subtractDay.subtractHour.subtractMinute;
      expect(result, DateTime(2024, 4, 19, 9, 29, 45));
    });
  });

  group('DateTimeSubtractDurationsExtensions - Negative Values', () {
    test('subtractMilliseconds with negative value adds time', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30, 45, 500);
      final DateTime result = now.subtractMilliseconds(-200);
      expect(result, DateTime(2024, 4, 20, 10, 30, 45, 700));
    });

    test('subtractSeconds with negative value adds time', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30, 45);
      final DateTime result = now.subtractSeconds(-15);
      expect(result, DateTime(2024, 4, 20, 10, 31, 0));
    });

    test('subtractMinutes with negative value adds time', () {
      final DateTime now = DateTime(2024, 4, 20, 10, 30);
      final DateTime result = now.subtractMinutes(-15);
      expect(result, DateTime(2024, 4, 20, 10, 45));
    });

    test('subtractHours with negative value adds time', () {
      final DateTime now = DateTime(2024, 4, 20, 10);
      final DateTime result = now.subtractHours(-5);
      expect(result, DateTime(2024, 4, 20, 15));
    });

    test('subtractDays with negative value adds time', () {
      final DateTime now = DateTime(2024, 4, 20);
      final DateTime result = now.subtractDays(-5);
      expect(result, DateTime(2024, 4, 25));
    });

    test('subtractWeeks with negative value adds time', () {
      final DateTime now = DateTime(2024, 4, 20);
      final DateTime result = now.subtractWeeks(-2);
      expect(result, DateTime(2024, 5, 4));
    });
  });

  group('DateTimeSubtractDurationsExtensions - Large Values', () {
    test('subtractDays with very large value', () {
      final DateTime now = DateTime(2024, 4, 20);
      final DateTime result = now.subtractDays(1000);
      expect(result, DateTime(2021, 7, 25));
    });

    test('subtractWeeks with very large value', () {
      final DateTime now = DateTime.utc(2024, 4, 20);
      final DateTime result = now.subtractWeek;
      expect(result, DateTime.utc(2024, 4, 13));
      final result2 = result.subtractWeeks(100);
      final diff = result2.difference(result);
      expect(diff.inDays, -100 * 7);
    });
  });

  group('DateTimeSubtractDurationsExtensions - Time Components', () {
    test('all time components are preserved when subtracting days', () {
      final DateTime now = DateTime(2024, 4, 20, 15, 30, 45, 500, 250);
      final DateTime result = now.subtractDays(5);
      expect(result, DateTime(2024, 4, 15, 15, 30, 45, 500, 250));
    });

    test('time zone is preserved', () {
      final DateTime localNow = DateTime(2024, 4, 20, 10);
      final DateTime utcNow = DateTime.utc(2024, 4, 20, 10);

      final DateTime localResult = localNow.subtractDays(5);
      final DateTime utcResult = utcNow.subtractDays(5);

      expect(localResult.isUtc, false);
      expect(utcResult.isUtc, true);
    });
  });
}
