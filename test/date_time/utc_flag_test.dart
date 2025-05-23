import 'package:test/test.dart';
import 'package:time_plus/src/date_time/utc_flag.dart';

void main() {
  group('DateTimeSameTimeZoneExtensions', () {
    group('withSameZone', () {
      test('creates UTC DateTime when original is UTC', () {
        final original = DateTime.utc(2023, 1, 1, 12, 30);

        final result = original.withSameUtcFlag(2024, 2, 3, 4, 5, 6, 7, 8);

        expect(result.isUtc, true);
        expect(result.year, 2024);
        expect(result.month, 2);
        expect(result.day, 3);
        expect(result.hour, 4);
        expect(result.minute, 5);
        expect(result.second, 6);
        expect(result.millisecond, 7);
        expect(result.microsecond, 8);
      });

      test('creates local DateTime when original is local', () {
        final original = DateTime(2023, 1, 1, 12, 30);

        final result = original.withSameUtcFlag(2024, 2, 3, 4, 5, 6, 7, 8);

        expect(result.isUtc, false);
        expect(result.year, 2024);
        expect(result.month, 2);
        expect(result.day, 3);
        expect(result.hour, 4);
        expect(result.minute, 5);
        expect(result.second, 6);
        expect(result.millisecond, 7);
        expect(result.microsecond, 8);
      });

      test('uses default values for unspecified parameters with UTC', () {
        final original = DateTime.utc(2023, 1, 1);

        // Only year specified
        var result = original.withSameUtcFlag(2024);
        expect(result.isUtc, true);
        expect(result.year, 2024);
        expect(result.month, 1);
        expect(result.day, 1);
        expect(result.hour, 0);
        expect(result.minute, 0);
        expect(result.second, 0);
        expect(result.millisecond, 0);
        expect(result.microsecond, 0);

        // Year and month specified
        result = original.withSameUtcFlag(2024, 5);
        expect(result.isUtc, true);
        expect(result.year, 2024);
        expect(result.month, 5);
        expect(result.day, 1);

        // Year, month, and day specified
        result = original.withSameUtcFlag(2024, 5, 15);
        expect(result.isUtc, true);
        expect(result.year, 2024);
        expect(result.month, 5);
        expect(result.day, 15);

        // Year, month, day, and hour specified
        result = original.withSameUtcFlag(2024, 5, 15, 10);
        expect(result.isUtc, true);
        expect(result.year, 2024);
        expect(result.month, 5);
        expect(result.day, 15);
        expect(result.hour, 10);
      });

      test('uses default values for unspecified parameters with local', () {
        final original = DateTime(2023, 1, 1);

        // Only year specified
        var result = original.withSameUtcFlag(2024);
        expect(result.isUtc, false);
        expect(result.year, 2024);
        expect(result.month, 1);
        expect(result.day, 1);
        expect(result.hour, 0);
        expect(result.minute, 0);
        expect(result.second, 0);
        expect(result.millisecond, 0);
        expect(result.microsecond, 0);

        // Year and month specified
        result = original.withSameUtcFlag(2024, 5);
        expect(result.isUtc, false);
        expect(result.year, 2024);
        expect(result.month, 5);
        expect(result.day, 1);

        // Year, month, and day specified
        result = original.withSameUtcFlag(2024, 5, 15);
        expect(result.isUtc, false);
        expect(result.year, 2024);
        expect(result.month, 5);
        expect(result.day, 15);

        // Year, month, day, and hour specified
        result = original.withSameUtcFlag(2024, 5, 15, 10);
        expect(result.isUtc, false);
        expect(result.year, 2024);
        expect(result.month, 5);
        expect(result.day, 15);
        expect(result.hour, 10);
      });

      test('preserves timezone characteristics', () {
        final utcTime = DateTime.utc(2023, 1, 1);
        final localTime = DateTime(2023, 1, 1);

        // Ensure different instances maintain their timezone
        final utcResult = utcTime.withSameUtcFlag(2024);
        final localResult = localTime.withSameUtcFlag(2024);

        expect(utcResult.isUtc, true);
        expect(localResult.isUtc, false);
      });

      test('handles edge cases for dates', () {
        final utcTime = DateTime.utc(2023, 1, 1);
        final localTime = DateTime(2023, 1, 1);

        // Leap year date
        var utcResult = utcTime.withSameUtcFlag(2024, 2, 29);
        var localResult = localTime.withSameUtcFlag(2024, 2, 29);

        expect(utcResult.month, 2);
        expect(utcResult.day, 29);
        expect(localResult.month, 2);
        expect(localResult.day, 29);

        // Month boundaries
        utcResult = utcTime.withSameUtcFlag(2023, 12, 31, 23, 59, 59, 999, 999);
        localResult =
            localTime.withSameUtcFlag(2023, 12, 31, 23, 59, 59, 999, 999);

        expect(utcResult.year, 2023);
        expect(utcResult.month, 12);
        expect(utcResult.day, 31);
        expect(utcResult.hour, 23);
        expect(utcResult.minute, 59);
        expect(utcResult.second, 59);
        expect(utcResult.millisecond, 999);
        expect(utcResult.microsecond, 999);

        expect(localResult.year, 2023);
        expect(localResult.month, 12);
        expect(localResult.day, 31);
        expect(localResult.hour, 23);
        expect(localResult.minute, 59);
        expect(localResult.second, 59);
        expect(localResult.millisecond, 999);
        expect(localResult.microsecond, 999);
      });

      test('compares equal to manually constructed equivalent DateTime', () {
        final utcOriginal = DateTime.utc(2023, 5, 15, 10, 30, 45);
        final localOriginal = DateTime(2023, 5, 15, 10, 30, 45);

        final utcResult =
            utcOriginal.withSameUtcFlag(2024, 6, 20, 12, 35, 50, 500, 600);
        final utcManual = DateTime.utc(2024, 6, 20, 12, 35, 50, 500, 600);

        final localResult =
            localOriginal.withSameUtcFlag(2024, 6, 20, 12, 35, 50, 500, 600);
        final localManual = DateTime(2024, 6, 20, 12, 35, 50, 500, 600);

        expect(utcResult, equals(utcManual));
        expect(localResult, equals(localManual));
      });

      test('chaining withSameZone calls works correctly', () {
        final utcOriginal = DateTime.utc(2023, 1, 1);
        final localOriginal = DateTime(2023, 1, 1);

        final utcResult = utcOriginal
            .withSameUtcFlag(2024)
            .withSameUtcFlag(2025, 2)
            .withSameUtcFlag(2026, 3, 4)
            .withSameUtcFlag(2027, 4, 5, 6);

        final localResult = localOriginal
            .withSameUtcFlag(2024)
            .withSameUtcFlag(2025, 2)
            .withSameUtcFlag(2026, 3, 4)
            .withSameUtcFlag(2027, 4, 5, 6);

        expect(utcResult.isUtc, true);
        expect(utcResult.year, 2027);
        expect(utcResult.month, 4);
        expect(utcResult.day, 5);
        expect(utcResult.hour, 6);

        expect(localResult.isUtc, false);
        expect(localResult.year, 2027);
        expect(localResult.month, 4);
        expect(localResult.day, 5);
        expect(localResult.hour, 6);
      });

      test('works with distant past dates (BCE)', () {
        final utcOriginal = DateTime.utc(2023, 1, 1);
        final localOriginal = DateTime(2023, 1, 1);

        // Note: DateTime in Dart supports years 0-9999, so -1000 is not valid
        // Instead, we'll test with early years
        final utcResult = utcOriginal.withSameUtcFlag(1, 1, 1);
        final localResult = localOriginal.withSameUtcFlag(1, 1, 1);

        expect(utcResult.isUtc, true);
        expect(utcResult.year, 1);
        expect(utcResult.month, 1);
        expect(utcResult.day, 1);

        expect(localResult.isUtc, false);
        expect(localResult.year, 1);
        expect(localResult.month, 1);
        expect(localResult.day, 1);
      });

      test('works with extreme future dates', () {
        final utcOriginal = DateTime.utc(2023, 1, 1);
        final localOriginal = DateTime(2023, 1, 1);

        // Test with year 9999 (max supported by DateTime)
        final utcResult = utcOriginal.withSameUtcFlag(9999, 12, 31, 23, 59, 59);
        final localResult =
            localOriginal.withSameUtcFlag(9999, 12, 31, 23, 59, 59);

        expect(utcResult.isUtc, true);
        expect(utcResult.year, 9999);
        expect(utcResult.month, 12);
        expect(utcResult.day, 31);
        expect(utcResult.hour, 23);
        expect(utcResult.minute, 59);
        expect(utcResult.second, 59);

        expect(localResult.isUtc, false);
        expect(localResult.year, 9999);
        expect(localResult.month, 12);
        expect(localResult.day, 31);
        expect(localResult.hour, 23);
        expect(localResult.minute, 59);
        expect(localResult.second, 59);
      });

      test('works with different months having different day counts', () {
        final utcOriginal = DateTime.utc(2023, 1, 1);
        final localOriginal = DateTime(2023, 1, 1);

        // Test with various month lengths (30, 31, 28, 29 days)
        final months = [
          [4, 30], // April - 30 days
          [1, 31], // January - 31 days
          [2, 28], // February 2023 - 28 days
          [2, 29], // February 2024 (leap year) - 29 days
        ];

        for (final monthData in months) {
          final month = monthData[0];
          final lastDay = monthData[1];
          final year = month == 2 && lastDay == 29 ? 2024 : 2023;

          final utcResult = utcOriginal.withSameUtcFlag(year, month, lastDay);
          final localResult =
              localOriginal.withSameUtcFlag(year, month, lastDay);

          expect(utcResult.year, year,
              reason: 'Year should be $year for month $month');
          expect(utcResult.month, month, reason: 'Month should be $month');
          expect(utcResult.day, lastDay,
              reason: 'Day should be $lastDay for month $month');

          expect(localResult.year, year,
              reason: 'Year should be $year for month $month');
          expect(localResult.month, month, reason: 'Month should be $month');
          expect(localResult.day, lastDay,
              reason: 'Day should be $lastDay for month $month');
        }
      });

      test(
          'preserves timezone information when using all parameter combinations',
          () {
        final utcOriginal = DateTime.utc(2023, 1, 1);
        final localOriginal = DateTime(2023, 1, 1);

        // Generate all possible parameter combinations
        final parameterCombos = [
          [2024],
          [2024, 2],
          [2024, 2, 3],
          [2024, 2, 3, 4],
          [2024, 2, 3, 4, 5],
          [2024, 2, 3, 4, 5, 6],
          [2024, 2, 3, 4, 5, 6, 7],
          [2024, 2, 3, 4, 5, 6, 7, 8],
        ];

        for (final params in parameterCombos) {
          final utcResult = _callWithSameZone(utcOriginal, params);
          final localResult = _callWithSameZone(localOriginal, params);

          expect(utcResult.isUtc, true,
              reason:
                  'UTC timezone should be preserved with ${params.length} parameters');
          expect(localResult.isUtc, false,
              reason:
                  'Local timezone should be preserved with ${params.length} parameters');
        }
      });
    });
  });
}

/// Helper function to call withSameZone with a dynamic number of parameters
DateTime _callWithSameZone(DateTime original, List<int> params) {
  switch (params.length) {
    case 1:
      return original.withSameUtcFlag(params[0]);
    case 2:
      return original.withSameUtcFlag(params[0], params[1]);
    case 3:
      return original.withSameUtcFlag(params[0], params[1], params[2]);
    case 4:
      return original.withSameUtcFlag(
          params[0], params[1], params[2], params[3]);
    case 5:
      return original.withSameUtcFlag(
          params[0], params[1], params[2], params[3], params[4]);
    case 6:
      return original.withSameUtcFlag(
          params[0], params[1], params[2], params[3], params[4], params[5]);
    case 7:
      return original.withSameUtcFlag(params[0], params[1], params[2],
          params[3], params[4], params[5], params[6]);
    case 8:
      return original.withSameUtcFlag(params[0], params[1], params[2],
          params[3], params[4], params[5], params[6], params[7]);
    default:
      throw ArgumentError('Unsupported parameter count: ${params.length}');
  }
}
