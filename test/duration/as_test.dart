import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DurationAsGettersExtensions', () {
    test('Zero duration', () {
      const d = Duration.zero;
      expect(d.asDays, equals(0));
      expect(d.asHours, equals(0));
      expect(d.asMinutes, equals(0));
      expect(d.asSeconds, equals(0));
      expect(d.asMilliseconds, equals(0));
    });

    test('Full units (positive)', () {
      expect(const Duration(days: 1).asDays, equals(1));
      expect(const Duration(hours: 1).asHours, equals(1));
      expect(const Duration(minutes: 1).asMinutes, equals(1));
      expect(const Duration(seconds: 1).asSeconds, equals(1));
      expect(const Duration(milliseconds: 1).asMilliseconds, equals(1));
    });

    test('Fractional durations', () {
      expect(const Duration(hours: 12).asDays, closeTo(0.5, 1e-10));
      expect(const Duration(minutes: 30).asHours, closeTo(0.5, 1e-10));
      expect(const Duration(seconds: 30).asMinutes, closeTo(0.5, 1e-10));
      expect(const Duration(milliseconds: 500).asSeconds, closeTo(0.5, 1e-10));
      expect(const Duration(microseconds: 500).asMilliseconds,
          closeTo(0.5, 1e-10));
    });

    test('Negative durations', () {
      expect(const Duration(days: -1).asDays, equals(-1));
      expect(const Duration(hours: -12).asDays, closeTo(-0.5, 1e-10));
      expect(const Duration(minutes: -30).asHours, closeTo(-0.5, 1e-10));
      expect(const Duration(seconds: -30).asMinutes, closeTo(-0.5, 1e-10));
      expect(
          const Duration(milliseconds: -500).asSeconds, closeTo(-0.5, 1e-10));
      expect(const Duration(microseconds: -500).asMilliseconds,
          closeTo(-0.5, 1e-10));
    });

    test('Mixed components', () {
      final d = Duration(days: 1, hours: 6); // 1.25 days
      expect(d.asDays, closeTo(1.25, 1e-10));

      final d2 = Duration(hours: 1, minutes: 30); // 1.5 hours
      expect(d2.asHours, closeTo(1.5, 1e-10));

      final d3 = Duration(minutes: 1, seconds: 30); // 1.5 minutes
      expect(d3.asMinutes, closeTo(1.5, 1e-10));

      final d4 = Duration(seconds: 1, milliseconds: 500); // 1.5 seconds
      expect(d4.asSeconds, closeTo(1.5, 1e-10));

      final d5 = Duration(milliseconds: 1, microseconds: 500); // 1.5 ms
      expect(d5.asMilliseconds, closeTo(1.5, 1e-10));
    });

    test('Micro edge cases', () {
      const d = Duration(microseconds: 1);
      expect(d.asMilliseconds, closeTo(0.001, 1e-10));

      const d2 = Duration(microseconds: -1);
      expect(d2.asMilliseconds, closeTo(-0.001, 1e-10));
    });

    test('Large durations', () {
      final d = Duration(days: 365);
      expect(d.asDays, equals(365));
      expect(d.asHours, equals(365 * 24));
      expect(d.asMinutes, equals(365 * 24 * 60));
      expect(d.asSeconds, equals(365 * 24 * 60 * 60));
      expect(d.asMilliseconds, equals(365 * 24 * 60 * 60 * 1000));
    });

    test('Cross-unit consistency', () {
      const d = Duration(
          days: 2,
          hours: 12,
          minutes: 30,
          seconds: 45,
          milliseconds: 500,
          microseconds: 250);

      // Test that conversions are consistent with each other
      expect(d.asDays * 24, closeTo(d.asHours, 1e-10));
      expect(d.asHours * 60, closeTo(d.asMinutes, 1e-10));
      expect(d.asMinutes * 60, closeTo(d.asSeconds, 1e-10));
      expect(d.asSeconds * 1000, closeTo(d.asMilliseconds, 1e-6));
    });

    test('Microsecond precision edge cases', () {
      // Test very small microsecond values
      expect(const Duration(microseconds: 1).asMilliseconds,
          closeTo(0.001, 1e-12));
      expect(const Duration(microseconds: 10).asMilliseconds,
          closeTo(0.01, 1e-12));
      expect(const Duration(microseconds: 100).asMilliseconds,
          closeTo(0.1, 1e-12));
      expect(const Duration(microseconds: 999).asMilliseconds,
          closeTo(0.999, 1e-12));

      // Test fractional milliseconds
      expect(const Duration(microseconds: 1500).asMilliseconds,
          closeTo(1.5, 1e-12));
      expect(const Duration(microseconds: 2750).asMilliseconds,
          closeTo(2.75, 1e-12));
    });

    test('Extreme duration values', () {
      // Test very large duration (close to max int microseconds)
      const largeDuration = Duration(days: 292471); // Close to max duration
      expect(largeDuration.asDays, equals(292471));
      expect(largeDuration.asHours, equals(292471 * 24));

      // Test very small positive duration
      const smallDuration = Duration(microseconds: 1);
      expect(smallDuration.asSeconds, closeTo(0.000001, 1e-12));
      expect(smallDuration.asMinutes, closeTo(0.000001 / 60, 1e-15));
      expect(smallDuration.asHours, closeTo(0.000001 / 3600, 1e-18));
      expect(smallDuration.asDays, closeTo(0.000001 / 86400, 1e-18));
    });

    test('Complex mixed duration precision', () {
      // Test a complex duration with all components
      final complexDuration = Duration(
        days: 5,
        hours: 14,
        minutes: 37,
        seconds: 28,
        milliseconds: 123,
        microseconds: 456,
      );

      // Verify precision is maintained through conversions
      final totalMicroseconds = complexDuration.inMicroseconds;
      final expectedMilliseconds = totalMicroseconds / 1000.0;
      final expectedSeconds = totalMicroseconds / 1000000.0;
      final expectedMinutes = totalMicroseconds / 60000000.0;
      final expectedHours = totalMicroseconds / 3600000000.0;
      final expectedDays = totalMicroseconds / 86400000000.0;

      expect(
          complexDuration.asMilliseconds, closeTo(expectedMilliseconds, 1e-10));
      expect(complexDuration.asSeconds, closeTo(expectedSeconds, 1e-10));
      expect(complexDuration.asMinutes, closeTo(expectedMinutes, 1e-10));
      expect(complexDuration.asHours, closeTo(expectedHours, 1e-10));
      expect(complexDuration.asDays, closeTo(expectedDays, 1e-10));
    });

    test('Floating point edge cases', () {
      // Test durations that might expose floating point precision issues
      const duration1 = Duration(microseconds: 123456789);
      const duration2 = Duration(milliseconds: 999, microseconds: 999);

      expect(duration1.asMilliseconds, closeTo(123456.789, 1e-9));
      expect(duration2.asMilliseconds, closeTo(999.999, 1e-9));
      expect(duration2.asSeconds, closeTo(0.999999, 1e-9));
    });

    test('Zero boundary tests', () {
      // Test values very close to zero
      const almostZero = Duration(microseconds: 1);
      const negativeAlmostZero = Duration(microseconds: -1);

      expect(almostZero.asMilliseconds, greaterThan(0));
      expect(almostZero.asSeconds, greaterThan(0));
      expect(almostZero.asMinutes, greaterThan(0));
      expect(almostZero.asHours, greaterThan(0));
      expect(almostZero.asDays, greaterThan(0));

      expect(negativeAlmostZero.asMilliseconds, lessThan(0));
      expect(negativeAlmostZero.asSeconds, lessThan(0));
      expect(negativeAlmostZero.asMinutes, lessThan(0));
      expect(negativeAlmostZero.asHours, lessThan(0));
      expect(negativeAlmostZero.asDays, lessThan(0));
    });

    group('Extended time units tests', () {
      test('asWeeks - basic functionality', () {
        expect(const Duration(days: 7).asWeeks, equals(1));
        expect(const Duration(days: 14).asWeeks, equals(2));
        expect(const Duration(days: 3, hours: 12).asWeeks, closeTo(0.5, 1e-10));
        expect(const Duration(days: -7).asWeeks, equals(-1));
        expect(Duration.zero.asWeeks, equals(0));
      });

      test('asWeeks - fractional weeks', () {
        expect(
            const Duration(days: 10, hours: 12).asWeeks, closeTo(1.5, 1e-10));
        expect(const Duration(days: 21).asWeeks, equals(3));
        expect(const Duration(hours: 84).asWeeks,
            closeTo(0.5, 1e-10)); // 3.5 days = 0.5 weeks
      });

      test('asMonths - basic functionality', () {
        // Using TimePlusConsts.daysInMonth = 30.436875
        final oneMonth =
            Duration(days: TimePlusConsts.averageDaysPerMonth.round());
        expect(oneMonth.asMonths, closeTo(1, 0.05));

        expect(const Duration(days: 91).asMonths, closeTo(3, 0.1)); // ~3 months
        expect(const Duration(days: -30).asMonths, closeTo(-1, 0.1));
        expect(Duration.zero.asMonths, equals(0));
      });

      test('asMonths - fractional months', () {
        final halfMonth =
            Duration(days: (TimePlusConsts.averageDaysPerMonth / 2).round());
        expect(halfMonth.asMonths, closeTo(0.5, 0.1));

        final twoAndHalfMonths =
            Duration(days: (TimePlusConsts.averageDaysPerMonth * 2.5).round());
        expect(twoAndHalfMonths.asMonths, closeTo(2.5, 0.1));
      });

      test('asYears - basic functionality', () {
        // Using TimePlusConsts.daysInYear = 365.2425
        final oneYear =
            Duration(days: TimePlusConsts.averageDaysPerYear.round());
        expect(oneYear.asYears, closeTo(1, 0.01));

        expect(const Duration(days: 730).asYears, closeTo(2, 0.01)); // ~2 years
        expect(const Duration(days: -365).asYears, closeTo(-1, 0.01));
        expect(Duration.zero.asYears, equals(0));
      });

      test('asYears - fractional years', () {
        final halfYear =
            Duration(days: (TimePlusConsts.averageDaysPerYear / 2).round());
        expect(halfYear.asYears, closeTo(0.5, 0.01));

        final oneAndQuarterYears =
            Duration(days: (TimePlusConsts.averageDaysPerYear * 1.25).round());
        expect(oneAndQuarterYears.asYears, closeTo(1.25, 0.01));
      });

      test('asDecades - basic functionality', () {
        // Using TimePlusConsts.daysInDecade = 3652.425
        final oneDecade =
            Duration(days: TimePlusConsts.averageDaysPerDecade.round());
        expect(oneDecade.asDecades, closeTo(1, 0.01));

        final twoDecades =
            Duration(days: (TimePlusConsts.averageDaysPerDecade * 2).round());
        expect(twoDecades.asDecades, closeTo(2, 0.01));
        expect(const Duration(days: -3652).asDecades, closeTo(-1, 0.01));
        expect(Duration.zero.asDecades, equals(0));
      });

      test('asDecades - fractional decades', () {
        final halfDecade =
            Duration(days: (TimePlusConsts.averageDaysPerDecade / 2).round());
        expect(halfDecade.asDecades, closeTo(0.5, 0.01));

        final threeAndHalfDecades =
            Duration(days: (TimePlusConsts.averageDaysPerDecade * 3.5).round());
        expect(threeAndHalfDecades.asDecades, closeTo(3.5, 0.01));
      });

      test('asCenturies - basic functionality', () {
        // Using TimePlusConsts.daysInCentury = 36524.25
        final oneCentury =
            Duration(days: TimePlusConsts.averageDaysPerCentury.round());
        expect(oneCentury.asCenturies, closeTo(1, 0.01));

        final twoCenturies =
            Duration(days: (TimePlusConsts.averageDaysPerCentury * 2).round());
        expect(twoCenturies.asCenturies, closeTo(2, 0.01));
        expect(const Duration(days: -36524).asCenturies, closeTo(-1, 0.01));
        expect(Duration.zero.asCenturies, equals(0));
      });

      test('asCenturies - fractional centuries', () {
        final halfCentury =
            Duration(days: (TimePlusConsts.averageDaysPerCentury / 2).round());
        expect(halfCentury.asCenturies, closeTo(0.5, 0.01));

        final oneAndQuarterCenturies = Duration(
            days: (TimePlusConsts.averageDaysPerCentury * 1.25).round());
        expect(oneAndQuarterCenturies.asCenturies, closeTo(1.25, 0.01));
      });

      test('Extended units consistency', () {
        final duration =
            const Duration(days: 10000); // Large duration for testing

        // Test that conversions are consistent with each other
        expect(duration.asWeeks * 7, closeTo(duration.asDays, 1e-10));
        expect(duration.asMonths * TimePlusConsts.averageDaysPerMonth,
            closeTo(duration.asDays, 1e-6));
        expect(duration.asYears * TimePlusConsts.averageDaysPerYear,
            closeTo(duration.asDays, 1e-6));
        expect(duration.asDecades * TimePlusConsts.averageDaysPerDecade,
            closeTo(duration.asDays, 1e-6));
        expect(duration.asCenturies * TimePlusConsts.averageDaysPerCentury,
            closeTo(duration.asDays, 1e-6));
      });

      test('Extended units hierarchical consistency', () {
        final duration = const Duration(days: 36525); // ~1 century

        // Test hierarchical relationships
        expect(duration.asYears / 10, closeTo(duration.asDecades, 0.01));
        expect(duration.asDecades / 10, closeTo(duration.asCenturies, 0.01));
        expect(duration.asYears / 100, closeTo(duration.asCenturies, 0.01));
        expect(duration.asMonths / 12, closeTo(duration.asYears, 0.1));
      });

      test('Extended units with mixed duration components', () {
        final complexDuration = Duration(
          days: 400,
          hours: 12,
          minutes: 30,
          seconds: 15,
        );

        // Verify all extended units work with complex durations
        expect(complexDuration.asWeeks, greaterThan(50));
        expect(complexDuration.asMonths, greaterThan(13));
        expect(complexDuration.asYears, greaterThan(1));
        expect(complexDuration.asDecades, greaterThan(0.1));
        expect(complexDuration.asCenturies, greaterThan(0.01));
      });

      test('Extended units extreme values', () {
        // Test very large durations
        const largeDuration = Duration(days: 100000);
        expect(largeDuration.asWeeks, closeTo(largeDuration.asDays / 7, 1e-10));
        expect(largeDuration.asCenturies, greaterThan(2));

        // Test very small durations
        const smallDuration = Duration(hours: 1);
        expect(smallDuration.asWeeks, closeTo(1.0 / (7 * 24), 1e-10));
        expect(smallDuration.asMonths, lessThan(0.01));
        expect(smallDuration.asYears, lessThan(0.001));
        expect(smallDuration.asDecades, lessThan(0.0001));
        expect(smallDuration.asCenturies, lessThan(0.00001));
      });

      test('Extended units negative durations', () {
        const negativeDuration = Duration(days: -365);

        expect(negativeDuration.asWeeks, closeTo(-52.14, 0.1));
        expect(negativeDuration.asMonths, closeTo(-12, 0.5));
        expect(negativeDuration.asYears, closeTo(-1, 0.01));
        expect(negativeDuration.asDecades, closeTo(-0.1, 0.01));
        expect(negativeDuration.asCenturies, closeTo(-0.01, 0.001));
      });
    });
  });
}
