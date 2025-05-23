import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DateTime isSame extensions', () {
    group('isSameYear', () {
      test('returns true for same year', () {
        final date1 = DateTime(2024, 1, 1);
        final date2 = DateTime(2024, 12, 31);
        expect(date1.isSameYear(date2), isTrue);
      });

      test('returns false for different years', () {
        final date1 = DateTime(2024, 1, 1);
        final date2 = DateTime(2023, 1, 1);
        expect(date1.isSameYear(date2), isFalse);
      });
    });

    group('isSameCentury', () {
      test('returns true for same century', () {
        final date1 = DateTime(2000, 1, 1);
        final date2 = DateTime(2099, 12, 31);
        expect(date1.isSameCentury(date2), isTrue);
      });

      test('returns false for different centuries', () {
        final date1 = DateTime(1999, 12, 31);
        final date2 = DateTime(2000, 1, 1);
        expect(date1.isSameCentury(date2), isFalse);
      });

      test('handles century boundaries correctly', () {
        final date1 = DateTime(1900, 1, 1);
        final date2 = DateTime(1899, 12, 31);
        expect(date1.isSameCentury(date2), isFalse);
      });

      test('handles different centuries far apart', () {
        final date1 = DateTime(1800, 1, 1);
        final date2 = DateTime(2100, 1, 1);
        expect(date1.isSameCentury(date2), isFalse);
      });

      test('handles same century with different years', () {
        final date1 = DateTime(2001, 1, 1);
        final date2 = DateTime(2098, 12, 31);
        expect(date1.isSameCentury(date2), isTrue);
      });

      test('handles century start and end dates', () {
        final date1 = DateTime(2000, 1, 1);
        final date2 = DateTime(2099, 12, 31);
        expect(date1.isSameCentury(date2), isTrue);
      });

      test('handles dates in the same century with different months and days',
          () {
        final date1 = DateTime(2024, 2, 29); // Leap day
        final date2 = DateTime(2096, 2, 29); // Leap day in same century
        expect(date1.isSameCentury(date2), isTrue);
      });

      test('handles dates in different centuries with same month and day', () {
        final date1 = DateTime(1999, 12, 31);
        final date2 = DateTime(2000, 12, 31);
        expect(date1.isSameCentury(date2), isFalse);
      });
    });

    group('isSameDecade', () {
      test('returns true for same decade', () {
        final date1 = DateTime(2020, 1, 1);
        final date2 = DateTime(2029, 12, 31);
        expect(date1.isSameDecade(date2), isTrue);
      });

      test('returns false for different decades', () {
        final date1 = DateTime(2019, 12, 31);
        final date2 = DateTime(2020, 1, 1);
        expect(date1.isSameDecade(date2), isFalse);
      });

      test('handles decade boundaries correctly', () {
        final date1 = DateTime(2030, 1, 1);
        final date2 = DateTime(2029, 12, 31);
        expect(date1.isSameDecade(date2), isFalse);
      });

      test('handles different decades far apart', () {
        final date1 = DateTime(2010, 1, 1);
        final date2 = DateTime(2030, 1, 1);
        expect(date1.isSameDecade(date2), isFalse);
      });

      test('handles same decade with different years', () {
        final date1 = DateTime(2021, 1, 1);
        final date2 = DateTime(2028, 12, 31);
        expect(date1.isSameDecade(date2), isTrue);
      });

      test('handles decade start and end dates', () {
        final date1 = DateTime(2020, 1, 1);
        final date2 = DateTime(2029, 12, 31);
        expect(date1.isSameDecade(date2), isTrue);
      });

      test('handles dates in the same decade with different months and days',
          () {
        final date1 = DateTime(2024, 2, 29); // Leap day
        final date2 = DateTime(2028, 2, 29); // Leap day in same decade
        expect(date1.isSameDecade(date2), isTrue);
      });

      test('handles dates in different decades with same month and day', () {
        final date1 = DateTime(2019, 12, 31);
        final date2 = DateTime(2020, 12, 31);
        expect(date1.isSameDecade(date2), isFalse);
      });

      test('handles dates around decade transition', () {
        final date1 = DateTime(2019, 12, 31, 23, 59, 59);
        final date2 = DateTime(2020, 1, 1, 0, 0, 0);
        expect(date1.isSameDecade(date2), isFalse);
      });

      test('handles dates in the middle of different decades', () {
        final date1 = DateTime(2025, 6, 15);
        final date2 = DateTime(2035, 6, 15);
        expect(date1.isSameDecade(date2), isFalse);
      });
    });

    group('isSameMonth', () {
      test('returns true for same month and year', () {
        final date1 = DateTime(2024, 3, 1);
        final date2 = DateTime(2024, 3, 31);
        expect(date1.isSameMonth(date2), isTrue);
      });

      test('returns false for different months', () {
        final date1 = DateTime(2024, 3, 1);
        final date2 = DateTime(2024, 4, 1);
        expect(date1.isSameMonth(date2), isFalse);
      });

      test('returns false for same month but different year', () {
        final date1 = DateTime(2024, 3, 1);
        final date2 = DateTime(2023, 3, 1);
        expect(date1.isSameMonth(date2), isFalse);
      });
    });

    group('isSameDay', () {
      test('returns true for same day, month, and year', () {
        final date1 = DateTime(2024, 3, 15, 0, 0, 0);
        final date2 = DateTime(2024, 3, 15, 23, 59, 59);
        expect(date1.isSameDay(date2), isTrue);
      });

      test('returns false for different days', () {
        final date1 = DateTime(2024, 3, 15);
        final date2 = DateTime(2024, 3, 16);
        expect(date1.isSameDay(date2), isFalse);
      });

      test('returns false for same day but different month', () {
        final date1 = DateTime(2024, 3, 15);
        final date2 = DateTime(2024, 4, 15);
        expect(date1.isSameDay(date2), isFalse);
      });
    });

    group('isSameHour', () {
      test('returns true for same hour, day, month, and year', () {
        final date1 = DateTime(2024, 3, 15, 14, 0, 0);
        final date2 = DateTime(2024, 3, 15, 14, 59, 59);
        expect(date1.isSameHour(date2), isTrue);
      });

      test('returns false for different hours', () {
        final date1 = DateTime(2024, 3, 15, 14, 0, 0);
        final date2 = DateTime(2024, 3, 15, 15, 0, 0);
        expect(date1.isSameHour(date2), isFalse);
      });

      test('returns false for same hour but different day', () {
        final date1 = DateTime(2024, 3, 15, 14, 0, 0);
        final date2 = DateTime(2024, 3, 16, 14, 0, 0);
        expect(date1.isSameHour(date2), isFalse);
      });
    });

    group('isSameMinute', () {
      test('returns true for same minute, hour, day, month, and year', () {
        final date1 = DateTime(2024, 3, 15, 14, 30, 0);
        final date2 = DateTime(2024, 3, 15, 14, 30, 59);
        expect(date1.isSameMinute(date2), isTrue);
      });

      test('returns false for different minutes', () {
        final date1 = DateTime(2024, 3, 15, 14, 30, 0);
        final date2 = DateTime(2024, 3, 15, 14, 31, 0);
        expect(date1.isSameMinute(date2), isFalse);
      });

      test('returns false for same minute but different hour', () {
        final date1 = DateTime(2024, 3, 15, 14, 30, 0);
        final date2 = DateTime(2024, 3, 15, 15, 30, 0);
        expect(date1.isSameMinute(date2), isFalse);
      });
    });

    group('isSameSecond', () {
      test('returns true for same second, minute, hour, day, month, and year',
          () {
        final date1 = DateTime(2024, 3, 15, 14, 30, 45, 0);
        final date2 = DateTime(2024, 3, 15, 14, 30, 45, 999);
        expect(date1.isSameSecond(date2), isTrue);
      });

      test('returns false for different seconds', () {
        final date1 = DateTime(2024, 3, 15, 14, 30, 45);
        final date2 = DateTime(2024, 3, 15, 14, 30, 46);
        expect(date1.isSameSecond(date2), isFalse);
      });

      test('returns false for same second but different minute', () {
        final date1 = DateTime(2024, 3, 15, 14, 30, 45);
        final date2 = DateTime(2024, 3, 15, 14, 31, 45);
        expect(date1.isSameSecond(date2), isFalse);
      });
    });

    group('isSameMillisecond', () {
      test(
          'returns true for same millisecond, second, minute, hour, day, month, and year',
          () {
        final date1 = DateTime(2024, 3, 15, 14, 30, 45, 500, 0);
        final date2 = DateTime(2024, 3, 15, 14, 30, 45, 500, 999);
        expect(date1.isSameMillisecond(date2), isTrue);
      });

      test('returns false for different milliseconds', () {
        final date1 = DateTime(2024, 3, 15, 14, 30, 45, 500);
        final date2 = DateTime(2024, 3, 15, 14, 30, 45, 501);
        expect(date1.isSameMillisecond(date2), isFalse);
      });

      test('returns false for same millisecond but different second', () {
        final date1 = DateTime(2024, 3, 15, 14, 30, 45, 500);
        final date2 = DateTime(2024, 3, 15, 14, 30, 46, 500);
        expect(date1.isSameMillisecond(date2), isFalse);
      });
    });

    group('isSameMicrosecond', () {
      test(
          'returns true for same microsecond, millisecond, second, minute, hour, day, month, and year',
          () {
        final date1 = DateTime(2024, 3, 15, 14, 30, 45, 500, 250);
        final date2 = DateTime(2024, 3, 15, 14, 30, 45, 500, 250);
        expect(date1.isSameMicrosecond(date2), isTrue);
      });

      test('returns false for different microseconds', () {
        final date1 = DateTime(2024, 3, 15, 14, 30, 45, 500, 250);
        final date2 = DateTime(2024, 3, 15, 14, 30, 45, 500, 251);
        expect(date1.isSameMicrosecond(date2), isFalse);
      });

      test('returns false for same microsecond but different millisecond', () {
        final date1 = DateTime(2024, 3, 15, 14, 30, 45, 500, 250);
        final date2 = DateTime(2024, 3, 15, 14, 30, 45, 501, 250);
        expect(date1.isSameMicrosecond(date2), isFalse);
      });
    });

    group('Edge cases', () {
      test('handles leap year dates correctly', () {
        final leapDay1 = DateTime(2024, 2, 29);
        final leapDay2 = DateTime(2024, 2, 29);
        final nonLeapDay = DateTime(2024, 2, 28);

        expect(leapDay1.isSameDay(leapDay2), isTrue);
        expect(leapDay1.isSameDay(nonLeapDay), isFalse);
      });

      test('handles year boundaries correctly', () {
        final newYearEve = DateTime(2024, 12, 31, 23, 59, 59);
        final newYear = DateTime(2025, 1, 1, 0, 0, 0);

        expect(newYearEve.isSameYear(newYear), isFalse);
        expect(newYearEve.isSameDay(newYear), isFalse);
      });

      test('handles month boundaries correctly', () {
        final endOfMonth = DateTime(2024, 3, 31, 23, 59, 59);
        final startOfNextMonth = DateTime(2024, 4, 1, 0, 0, 0);

        expect(endOfMonth.isSameMonth(startOfNextMonth), isFalse);
        expect(endOfMonth.isSameDay(startOfNextMonth), isFalse);
      });

      test('handles day boundaries correctly', () {
        final endOfDay = DateTime(2024, 3, 15, 23, 59, 59);
        final startOfNextDay = DateTime(2024, 3, 16, 0, 0, 0);

        expect(endOfDay.isSameDay(startOfNextDay), isFalse);
        expect(endOfDay.isSameHour(startOfNextDay), isFalse);
      });
    });
  });
}
