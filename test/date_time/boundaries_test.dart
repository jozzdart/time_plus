import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DateTime Boundaries', () {
    group('Minute Boundaries', () {
      test('startOfMinute removes seconds and smaller units', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final start = date.startOfMinute;
        expect(start, DateTime(2024, 2, 29, 15, 30));
      });

      test('endOfMinute adds one minute', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final end = date.endOfMinute;
        expect(end, DateTime(2024, 2, 29, 15, 31));
      });

      test('handles minute boundary at 59', () {
        final date = DateTime(2024, 2, 29, 15, 59, 45, 123, 456);
        final end = date.endOfMinute;
        expect(end, DateTime(2024, 2, 29, 16, 0));
      });
    });

    group('Hour Boundaries', () {
      test('startOfHour removes minutes and smaller units', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final start = date.startOfHour;
        expect(start, DateTime(2024, 2, 29, 15));
      });

      test('endOfHour adds one hour', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final end = date.endOfHour;
        expect(end, DateTime(2024, 2, 29, 16));
      });

      test('handles hour boundary at 23', () {
        final date = DateTime(2024, 2, 29, 23, 30, 45, 123, 456);
        final end = date.endOfHour;
        expect(end, DateTime(2024, 3, 1, 0));
      });
    });

    group('Day Boundaries', () {
      test('startOfDay removes hours and smaller units', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final start = date.startOfDay;
        expect(start, DateTime(2024, 2, 29));
      });

      test('endOfDay adds one day', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final end = date.endOfDay;
        expect(end, DateTime(2024, 3, 1));
      });

      test('handles day boundary at month end', () {
        final date = DateTime(2024, 1, 31, 23, 59, 59, 999, 999);
        final end = date.endOfDay;
        expect(end, DateTime(2024, 2, 1));
      });
    });

    group('Week Boundaries', () {
      test('startOfWeek returns Monday of the current week', () {
        // Wednesday
        final date = DateTime(2024, 2, 28, 15, 30, 45, 123, 456);
        final start = date.startOfWeek;
        expect(start, DateTime(2024, 2, 26)); // Monday
      });

      test('endOfWeek returns Monday of next week', () {
        // Wednesday
        final date = DateTime(2024, 2, 28, 15, 30, 45, 123, 456);
        final end = date.endOfWeek;
        expect(end, DateTime(2024, 3, 4)); // Next Monday
      });

      test('startOfWeek handles week spanning month boundary', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final start = date.startOfWeek;
        expect(start, DateTime(2024, 2, 26));
      });

      test('endOfWeek handles week spanning month boundary', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final end = date.endOfWeek;
        expect(end, DateTime(2024, 3, 4));
      });

      test('handles week boundary at year end', () {
        final date = DateTime(2024, 12, 31, 15, 30, 45, 123, 456);
        final end = date.endOfWeek;
        expect(end, DateTime(2025, 1, 6));
      });

      test('handles week boundary at year start', () {
        final date = DateTime(2024, 1, 1, 15, 30, 45, 123, 456);
        final start = date.startOfWeek;
        expect(start, DateTime(2023, 12, 25));
      });
    });

    group('Month Boundaries', () {
      test('startOfMonth returns first day of month', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final start = date.startOfMonth;
        expect(start, DateTime(2024, 2, 1));
      });

      test('endOfMonth returns first day of next month', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final end = date.endOfMonth;
        expect(end, DateTime(2024, 3, 1));
      });

      test('handles December to January transition', () {
        final date = DateTime(2024, 12, 31, 15, 30, 45, 123, 456);
        final end = date.endOfMonth;
        expect(end, DateTime(2025, 1, 1));
      });

      test('handles months with different lengths', () {
        // 31-day month
        final date31 = DateTime(2024, 1, 31, 15, 30, 45, 123, 456);
        expect(date31.endOfMonth, DateTime(2024, 2, 1));

        // 30-day month
        final date30 = DateTime(2024, 4, 30, 15, 30, 45, 123, 456);
        expect(date30.endOfMonth, DateTime(2024, 5, 1));

        // February in leap year
        final dateFeb = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        expect(dateFeb.endOfMonth, DateTime(2024, 3, 1));
      });
    });

    group('Year Boundaries', () {
      test('startOfYear returns January 1st', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final start = date.startOfYear;
        expect(start, DateTime(2024, 1, 1));
      });

      test('endOfYear returns January 1st of next year', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final end = date.endOfYear;
        expect(end, DateTime(2025, 1, 1));
      });

      test('handles leap year transition', () {
        final date = DateTime(2024, 12, 31, 15, 30, 45, 123, 456);
        final end = date.endOfYear;
        expect(end, DateTime(2025, 1, 1));
      });

      test('handles century boundary', () {
        final date = DateTime(2099, 12, 31, 23, 59, 59, 999, 999);
        final end = date.endOfYear;
        expect(end, DateTime(2100, 1, 1));
      });
    });

    group('Edge Cases', () {
      test('handles leap year February 29th', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        expect(date.startOfDay, DateTime(2024, 2, 29));
        expect(date.endOfDay, DateTime(2024, 3, 1));
      });

      test('handles year boundary with leap year', () {
        final date = DateTime(2023, 12, 31, 23, 59, 59, 999, 999);
        expect(date.endOfYear, DateTime(2024, 1, 1));
      });

      test('handles month boundary with different days', () {
        final date = DateTime(2024, 1, 31, 23, 59, 59, 999, 999);
        expect(date.endOfMonth, DateTime(2024, 2, 1));
      });

      test('handles non-leap year February', () {
        final date = DateTime(2023, 2, 28, 23, 59, 59, 999, 999);
        expect(date.endOfMonth, DateTime(2023, 3, 1));
      });

      test('handles timezone edge cases', () {
        final date = DateTime.utc(2024, 12, 31, 23, 59, 59, 999, 999);
        expect(date.endOfYear, DateTime.utc(2025, 1, 1));
      });

      test('handles microsecond precision', () {
        final date = DateTime(2024, 12, 31, 23, 59, 59, 999, 999);
        final start = date.startOfMinute;
        expect(start.microsecond, 0);
        expect(start.millisecond, 0);
        expect(start.second, 0);
      });
    });

    group('Decade Boundaries', () {
      test('startOfDecade returns first day of decade', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final start = date.startOfDecade;
        expect(start, DateTime(2020, 1, 1));
      });

      test('endOfDecade returns first day of next decade', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final end = date.endOfDecade;
        expect(end, DateTime(2030, 1, 1));
      });

      test('handles decade boundary at year end', () {
        final date = DateTime(2019, 12, 31, 23, 59, 59, 999, 999);
        final end = date.endOfDecade;
        expect(end, DateTime(2020, 1, 1));
      });

      test('handles decade boundary at year start', () {
        final date = DateTime(2020, 1, 1, 0, 0, 0, 0, 0);
        final start = date.startOfDecade;
        expect(start, DateTime(2020, 1, 1));
      });

      test('handles different decades', () {
        // 2010s
        final date2010s = DateTime(2015, 6, 15, 12, 30, 45, 123, 456);
        expect(date2010s.startOfDecade, DateTime(2010, 1, 1));
        expect(date2010s.endOfDecade, DateTime(2020, 1, 1));

        // 2020s
        final date2020s = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        expect(date2020s.startOfDecade, DateTime(2020, 1, 1));
        expect(date2020s.endOfDecade, DateTime(2030, 1, 1));

        // 2030s
        final date2030s = DateTime(2035, 12, 31, 23, 59, 59, 999, 999);
        expect(date2030s.startOfDecade, DateTime(2030, 1, 1));
        expect(date2030s.endOfDecade, DateTime(2040, 1, 1));
      });
    });

    group('Century Boundaries', () {
      test('startOfCentury returns first day of century', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final start = date.startOfCentury;
        expect(start, DateTime(2000, 1, 1));
      });

      test('endOfCentury returns first day of next century', () {
        final date = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        final end = date.endOfCentury;
        expect(end, DateTime(2100, 1, 1));
      });

      test('handles century boundary at year end', () {
        final date = DateTime(2099, 12, 31, 23, 59, 59, 999, 999);
        final end = date.endOfCentury;
        expect(end, DateTime(2100, 1, 1));
      });

      test('handles century boundary at year start', () {
        final date = DateTime(2100, 1, 1, 0, 0, 0, 0, 0);
        final start = date.startOfCentury;
        expect(start, DateTime(2100, 1, 1));
      });

      test('handles different centuries', () {
        // 20th century
        final date20th = DateTime(1995, 6, 15, 12, 30, 45, 123, 456);
        expect(date20th.startOfCentury, DateTime(1900, 1, 1));
        expect(date20th.endOfCentury, DateTime(2000, 1, 1));

        // 21st century
        final date21st = DateTime(2024, 2, 29, 15, 30, 45, 123, 456);
        expect(date21st.startOfCentury, DateTime(2000, 1, 1));
        expect(date21st.endOfCentury, DateTime(2100, 1, 1));

        // 22nd century
        final date22nd = DateTime(2150, 12, 31, 23, 59, 59, 999, 999);
        expect(date22nd.startOfCentury, DateTime(2100, 1, 1));
        expect(date22nd.endOfCentury, DateTime(2200, 1, 1));
      });

      test('handles timezone for century boundaries', () {
        final date = DateTime.utc(2099, 12, 31, 23, 59, 59, 999, 999);
        final end = date.endOfCentury;
        expect(end, DateTime.utc(2100, 1, 1));
      });
    });
  });
}
