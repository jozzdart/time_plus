import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart'; // adjust if needed

void main() {
  group('DurationOnlyExtensions', () {
    test('extracts each unit correctly from positive duration', () {
      final duration = Duration(
        days: 2,
        hours: 5,
        minutes: 45,
        seconds: 30,
        milliseconds: 123,
        microseconds: 456,
      );

      expect(duration.onlyDays, 2);
      expect(duration.onlyHours, 5);
      expect(duration.onlyMinutes, 45);
      expect(duration.onlySeconds, 30);
      expect(duration.onlyMilliseconds, 123);
      expect(duration.onlyMicroseconds, 456);
    });

    test('extracts each unit correctly from negative duration', () {
      final duration = Duration(
        days: -3,
        hours: -4,
        minutes: -20,
        seconds: -15,
        milliseconds: -987,
        microseconds: -654,
      );

      final remainder = duration - Duration(days: duration.onlyDays);

      expect(duration.onlyDays, -3);
      expect(
          remainder.onlyHours, 19); // 24 - 4 = 20 - 1 for overflow from minutes
      expect(remainder.onlyMinutes, 39); // 60 - 20 = 40 - 1
      expect(remainder.onlySeconds, 44); // 60 - 15 = 45 - 1
      expect(remainder.onlyMilliseconds, 12); // 1000 - 987 = 13 - 1
      expect(remainder.onlyMicroseconds, 346); // 1000 - 654 = 346
    });

    test('returns zero for pure unit duration', () {
      expect(Duration(hours: 0).onlyDays, 0);
      expect(Duration(hours: 1).onlyHours, 1);
      expect(Duration(minutes: 1).onlyMinutes, 1);
      expect(Duration(seconds: 1).onlySeconds, 1);
      expect(Duration(milliseconds: 1).onlyMilliseconds, 1);
      expect(Duration(microseconds: 1).onlyMicroseconds, 1);
    });

    test('works correctly with complex overflow', () {
      final duration = Duration(
        days: 1,
        hours: 25,
        minutes: 61,
        seconds: 61,
        milliseconds: 1001,
        microseconds: 2001,
      );

      expect(duration.onlyDays, 2);
      expect(duration.onlyHours, 2);
      expect(duration.onlyMinutes, 2);
      expect(duration.onlySeconds, 2);
      expect(duration.onlyMilliseconds, 3);
      expect(duration.onlyMicroseconds, 1);
    });

    test('zero duration returns all zeros', () {
      const duration = Duration.zero;

      expect(duration.onlyDays, 0);
      expect(duration.onlyHours, 0);
      expect(duration.onlyMinutes, 0);
      expect(duration.onlySeconds, 0);
      expect(duration.onlyMilliseconds, 0);
      expect(duration.onlyMicroseconds, 0);
    });

    test('handles maximum values for each unit', () {
      final duration = Duration(
        days: 99999,
        hours: 23,
        minutes: 59,
        seconds: 59,
        milliseconds: 999,
        microseconds: 999,
      );

      expect(duration.onlyDays, 99999);
      expect(duration.onlyHours, 23);
      expect(duration.onlyMinutes, 59);
      expect(duration.onlySeconds, 59);
      expect(duration.onlyMilliseconds, 999);
      expect(duration.onlyMicroseconds, 999);
    });

    test('handles minimum values for each unit', () {
      final duration = Duration(
        days: -999999,
        hours: -23,
        minutes: -59,
        seconds: -59,
        milliseconds: -999,
        microseconds: -999,
      );

      final remainder = duration - Duration(days: duration.onlyDays);

      expect(duration.onlyDays, -999999);
      expect(remainder.onlyHours, 0);
      expect(remainder.onlyMinutes, 0);
      expect(remainder.onlySeconds, 0);
      expect(remainder.onlyMilliseconds, 0);
      expect(remainder.onlyMicroseconds, 1);
    });

    test('handles single unit conversions correctly', () {
      // Test converting between adjacent units
      expect(Duration(microseconds: 1000).onlyMilliseconds, 1);
      expect(Duration(milliseconds: 1000).onlySeconds, 1);
      expect(Duration(seconds: 60).onlyMinutes, 1);
      expect(Duration(minutes: 60).onlyHours, 1);
      expect(Duration(hours: 24).onlyDays, 1);
    });

    test('handles partial unit conversions', () {
      // Test partial conversions between units
      expect(Duration(microseconds: 500).onlyMilliseconds, 0);
      expect(Duration(milliseconds: 500).onlySeconds, 0);
      expect(Duration(seconds: 30).onlyMinutes, 0);
      expect(Duration(minutes: 30).onlyHours, 0);
      expect(Duration(hours: 12).onlyDays, 0);
    });

    test('handles mixed positive and negative values', () {
      final duration = Duration(
        days: 1,
        hours: -1,
        minutes: 1,
        seconds: -1,
        milliseconds: 1,
        microseconds: -1,
      );

      expect(duration.onlyDays, 0);
      expect(duration.onlyHours, 23);
      expect(duration.onlyMinutes, 0);
      expect(duration.onlySeconds, 59);
      expect(duration.onlyMilliseconds, 0);
      expect(duration.onlyMicroseconds, 999);
    });

    test('handles very small durations', () {
      final duration = Duration(microseconds: 1);

      expect(duration.onlyDays, 0);
      expect(duration.onlyHours, 0);
      expect(duration.onlyMinutes, 0);
      expect(duration.onlySeconds, 0);
      expect(duration.onlyMilliseconds, 0);
      expect(duration.onlyMicroseconds, 1);
    });

    test('handles very large durations', () {
      final duration = Duration(
          days: 999999,
          hours: 23,
          minutes: 59,
          seconds: 59,
          milliseconds: 999,
          microseconds: 999);

      expect(duration.onlyDays, 999999);
      expect(duration.onlyHours, 23);
      expect(duration.onlyMinutes, 59);
      expect(duration.onlySeconds, 59);
      expect(duration.onlyMilliseconds, 999);
      expect(duration.onlyMicroseconds, 999);
    });
  });
}
