import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DoubleSmartDuration extension', () {
    group('Basic unit conversions', () {
      test('days conversion preserves precision', () {
        expect(1.0.days, Duration(days: 1));
        expect(1.5.days, Duration(days: 1, hours: 12));
        expect(2.25.days, Duration(days: 2, hours: 6));
        expect(0.5.days, Duration(hours: 12));
        expect(0.25.days, Duration(hours: 6));
        expect(0.125.days, Duration(hours: 3));
      });

      test('hours conversion preserves precision', () {
        expect(1.0.hours, Duration(hours: 1));
        expect(1.5.hours, Duration(hours: 1, minutes: 30));
        expect(2.25.hours, Duration(hours: 2, minutes: 15));
        expect(0.5.hours, Duration(minutes: 30));
        expect(0.25.hours, Duration(minutes: 15));
        expect(0.1.hours, Duration(minutes: 6));
      });

      test('minutes conversion preserves precision', () {
        expect(1.0.minutes, Duration(minutes: 1));
        expect(1.5.minutes, Duration(minutes: 1, seconds: 30));
        expect(2.25.minutes, Duration(minutes: 2, seconds: 15));
        expect(0.5.minutes, Duration(seconds: 30));
        expect(0.25.minutes, Duration(seconds: 15));
      });

      test('seconds conversion preserves precision', () {
        expect(1.0.seconds, Duration(seconds: 1));
        expect(1.5.seconds, Duration(seconds: 1, milliseconds: 500));
        expect(2.25.seconds, Duration(seconds: 2, milliseconds: 250));
        expect(0.5.seconds, Duration(milliseconds: 500));
        expect(0.25.seconds, Duration(milliseconds: 250));
        expect(0.125.seconds, Duration(milliseconds: 125));
      });

      test('milliseconds conversion preserves precision', () {
        expect(1.0.milliseconds, Duration(milliseconds: 1));
        expect(1.5.milliseconds, Duration(milliseconds: 1, microseconds: 500));
        expect(2.25.milliseconds, Duration(milliseconds: 2, microseconds: 250));
        expect(0.5.milliseconds, Duration(microseconds: 500));
        expect(0.25.milliseconds, Duration(microseconds: 250));
        expect(0.125.milliseconds, Duration(microseconds: 125));
      });

      test('weeks conversion preserves precision', () {
        expect(1.0.weeks, Duration(days: 7));
        expect(2.0.weeks, Duration(days: 14));
        expect(0.5.weeks, Duration(days: 3, hours: 12));
        expect(1.5.weeks, Duration(days: 10, hours: 12));
      });

      test('months conversion (approximation based on Gregorian average)', () {
        // Note: These are approximations based on 30.436875 days per month
        expect(1.0.months.inDays, closeTo(30, 1)); // ~30.44 days
        expect(2.0.months.inDays, closeTo(61, 1)); // ~60.87 days
        expect(
            12.0.months.inDays, closeTo(365, 1)); // Should be close to a year
        expect(0.5.months.inDays, closeTo(15, 1)); // ~15.22 days
      });

      test('years conversion (approximation based on Gregorian average)', () {
        // Note: These are approximations based on 365.2425 days per year
        expect(1.0.years.inDays, closeTo(365, 1)); // ~365.24 days
        expect(4.0.years.inDays, closeTo(1461, 1)); // Leap year cycle
        expect(0.5.years.inDays, closeTo(183, 1)); // Half year
        expect(10.0.years.inDays, closeTo(3652, 1)); // Decade
      });

      test('decades conversion (approximation based on Gregorian average)', () {
        // Note: These are approximations based on 3652.425 days per decade
        expect(1.0.decades.inDays, closeTo(3652, 1)); // ~3652.43 days
        expect(0.5.decades.inDays, closeTo(1826, 1)); // Half decade (5 years)
        expect(2.0.decades.inDays, closeTo(7305, 1)); // 20 years
      });

      test('centuries conversion (approximation based on Gregorian average)',
          () {
        // Note: These are approximations based on 36524.25 days per century
        expect(1.0.centuries.inDays, closeTo(36524, 1)); // ~36524.25 days
        expect(
            0.5.centuries.inDays, closeTo(18262, 1)); // Half century (50 years)
        expect(0.1.centuries.inDays, closeTo(3652, 1)); // One decade
      });
    });

    group('High precision tests', () {
      test('very small fractional days preserve microsecond precision', () {
        // 1 microsecond = 1/86,400,000,000 days
        final oneMicroDayValue = 1.0 / (24 * 60 * 60 * 1000 * 1000);
        expect(oneMicroDayValue.days, Duration(microseconds: 1));

        // Test multiple microseconds
        final tenMicroDayValue = 10.0 / (24 * 60 * 60 * 1000 * 1000);
        expect(tenMicroDayValue.days, Duration(microseconds: 10));
      });

      test('very small fractional hours preserve microsecond precision', () {
        // 1 microsecond = 1/3,600,000,000 hours
        final oneMicroHourValue = 1.0 / (60 * 60 * 1000 * 1000);
        expect(oneMicroHourValue.hours, Duration(microseconds: 1));

        final tenMicroHourValue = 10.0 / (60 * 60 * 1000 * 1000);
        expect(tenMicroHourValue.hours, Duration(microseconds: 10));
      });

      test('very small fractional minutes preserve microsecond precision', () {
        // 1 microsecond = 1/60,000,000 minutes
        final oneMicroMinuteValue = 1.0 / (60 * 1000 * 1000);
        expect(oneMicroMinuteValue.minutes, Duration(microseconds: 1));

        final tenMicroMinuteValue = 10.0 / (60 * 1000 * 1000);
        expect(tenMicroMinuteValue.minutes, Duration(microseconds: 10));
      });

      test('very small fractional seconds preserve microsecond precision', () {
        // 1 microsecond = 1/1,000,000 seconds
        final oneMicroSecondValue = 1.0 / 1000000;
        expect(oneMicroSecondValue.seconds, Duration(microseconds: 1));

        final tenMicroSecondValue = 10.0 / 1000000;
        expect(tenMicroSecondValue.seconds, Duration(microseconds: 10));
      });

      test('fractional milliseconds preserve microsecond precision', () {
        expect(0.001.milliseconds, Duration(microseconds: 1));
        expect(0.01.milliseconds, Duration(microseconds: 10));
        expect(0.1.milliseconds, Duration(microseconds: 100));
        expect(0.999.milliseconds, Duration(microseconds: 999));
      });
    });

    group('Complex multi-unit decomposition', () {
      test('fractional days decompose correctly into all units', () {
        // 1.5 days = 1 day + 12 hours
        final result1 = 1.5.days;
        expect(result1.inDays, 1);
        expect(result1.inHours % 24, 12);
        expect(result1.inMinutes % 60, 0);
        expect(result1.inSeconds % 60, 0);
        expect(result1.inMilliseconds % 1000, 0);

        // 2.75 days = 2 days + 18 hours
        final result2 = 2.75.days;
        expect(result2.inDays, 2);
        expect(result2.inHours % 24, 18);
        expect(result2.inMinutes % 60, 0);
      });

      test('fractional hours with complex breakdowns', () {
        // 3.5416666667 hours = 3 hours + 32 minutes + 30 seconds
        final complexHours = 3.0 + (32.0 / 60.0) + (30.0 / 3600.0);
        final result = complexHours.hours;

        expect(result.inHours, 3);
        expect(result.inMinutes % 60, 32);
        expect(result.inSeconds % 60, 30);
      });

      test('very precise fractional values maintain accuracy', () {
        // Test a value that requires all units: days, hours, minutes, seconds, milliseconds, microseconds
        final preciseValue = 1.0 + // 1 day
            (1.0 / 24.0) + // 1 hour
            (1.0 / (24.0 * 60.0)) + // 1 minute
            (1.0 / (24.0 * 60.0 * 60.0)) + // 1 second
            (1.0 / (24.0 * 60.0 * 60.0 * 1000.0)) + // 1 millisecond
            (1.0 / (24.0 * 60.0 * 60.0 * 1000.0 * 1000.0)); // 1 microsecond

        final result = preciseValue.days;
        expect(result.inDays, 1);
        expect(result.inHours % 24, 1);
        expect(result.inMinutes % 60, 1);
        expect(result.inSeconds % 60, 1);
        expect(result.inMilliseconds % 1000, 1);
        expect(result.inMicroseconds % 1000, 1);
      });
    });

    group('Edge cases and boundary conditions', () {
      test('zero values', () {
        expect(0.0.days, Duration.zero);
        expect(0.0.hours, Duration.zero);
        expect(0.0.minutes, Duration.zero);
        expect(0.0.seconds, Duration.zero);
        expect(0.0.milliseconds, Duration.zero);
        expect(0.0.weeks, Duration.zero);
        expect(0.0.months, Duration.zero);
        expect(0.0.years, Duration.zero);
        expect(0.0.decades, Duration.zero);
        expect(0.0.centuries, Duration.zero);
      });

      test('negative values', () {
        expect((-1.0).days, Duration(days: -1));
        expect(
            (-1.5).hours, Duration(minutes: -90)); // -1.5 hours = -90 minutes
        expect((-2.25).minutes,
            Duration(seconds: -135)); // -2.25 minutes = -135 seconds
        expect((-0.5).seconds, Duration(milliseconds: -500));
        expect((-0.25).milliseconds, Duration(microseconds: -250));
        expect((-1.0).weeks.inDays, -7);
        expect((-1.0).months.inDays, closeTo(-30, 1)); // Approximation
        expect((-1.0).years.inDays, closeTo(-365, 1)); // Approximation
        expect(
            (-0.5).decades.inDays, closeTo(-1826, 1)); // Half decade negative
        expect(
            (-0.1).centuries.inDays, closeTo(-3652, 1)); // One decade negative
      });

      test('very large values', () {
        final largeDays = 365000.0; // ~1000 years
        final result = largeDays.days;
        expect(result.inDays, 365000);

        final largeHours = 8760000.0; // ~1000 years in hours
        final resultHours = largeHours.hours;
        expect(resultHours.inHours, 8760000);
      });

      test('very small positive values', () {
        final tinyDay = 1e-9; // Very small fraction of a day
        final result = tinyDay.days;
        expect(result.inMicroseconds, greaterThan(0));

        final tinySecond = 1e-6; // 1 microsecond
        expect(tinySecond.seconds, Duration(microseconds: 1));
      });

      test('boundary microsecond precision', () {
        // Test the smallest representable duration difference
        final smallestIncrement =
            1.0 / (1000 * 1000); // 1 microsecond in seconds
        expect(smallestIncrement.seconds, Duration(microseconds: 1));

        // Test that smaller values round appropriately
        final verySmall = 0.1 / (1000 * 1000); // 0.1 microseconds in seconds
        final result = verySmall.seconds;
        // Should be either 0 or 1 microsecond due to rounding
        expect(result.inMicroseconds, anyOf(0, 1));
      });
    });

    group('Mathematical properties and consistency', () {
      test('addition distributivity', () {
        final a = 1.5;
        final b = 2.25;

        // (a + b).unit should equal a.unit + b.unit
        expect((a + b).days, equals(a.days + b.days));
        expect((a + b).hours, equals(a.hours + b.hours));
        expect((a + b).minutes, equals(a.minutes + b.minutes));
        expect((a + b).seconds, equals(a.seconds + b.seconds));
        expect((a + b).milliseconds, equals(a.milliseconds + b.milliseconds));
      });

      test('scalar multiplication', () {
        final base = 1.5;
        final multiplier = 3.0;

        // (base * multiplier).unit should equal base.unit * multiplier (approximately)
        expect(
            (base * multiplier).days, equals(base.days * multiplier.toInt()));
        expect((base * multiplier).hours.inHours,
            equals(4)); // 4.5 hours has 4 whole hours
      });

      test('unit conversion consistency', () {
        final value = 1.5;

        // Converting between units should maintain the same total duration
        expect(value.days.inMicroseconds,
            equals((value * 24).hours.inMicroseconds));
        expect(value.hours.inMicroseconds,
            equals((value * 60).minutes.inMicroseconds));
        expect(value.minutes.inMicroseconds,
            equals((value * 60).seconds.inMicroseconds));
        expect(value.seconds.inMicroseconds,
            equals((value * 1000).milliseconds.inMicroseconds));
        expect(value.weeks.inMicroseconds,
            equals((value * 7).days.inMicroseconds));
      });

      test('approximation unit consistency', () {
        // Test consistency of approximation-based units with their constants
        const value = 1.0;

        // Test that 1 year ≈ 12 months (within reasonable tolerance)
        expect(value.years.inMicroseconds,
            closeTo(12 * value.months.inMicroseconds, 1e5));

        // Test that 1 decade = 10 years
        expect(value.decades.inMicroseconds,
            closeTo(10 * value.years.inMicroseconds, 1e5));

        // Test that 1 century = 10 decades
        expect(value.centuries.inMicroseconds,
            closeTo(10 * value.decades.inMicroseconds, 1e5));

        // Test that 1 century = 100 years
        expect(value.centuries.inMicroseconds,
            closeTo(100 * value.years.inMicroseconds, 1e5));
      });

      test('inverse operations', () {
        final originalDays = 2.5;
        final duration = originalDays.days;
        final convertedBack =
            duration.inMicroseconds / (Duration.microsecondsPerDay);

        expect(convertedBack, closeTo(originalDays, 1e-6));
      });
    });

    group('Rounding and precision behavior', () {
      test('microsecond rounding behavior', () {
        // Test values that might cause rounding issues
        final problematicValues = [
          1.0 / 3.0, // 0.333...
          2.0 / 3.0, // 0.666...
          1.0 / 7.0, // 0.142857...
          1.0 / 9.0, // 0.111...
        ];

        for (final value in problematicValues) {
          final result = value.seconds;
          // Should not throw and should produce a valid duration
          expect(result, isA<Duration>());
          expect(result.inMicroseconds, isA<int>());
        }
      });

      test('extreme precision boundaries', () {
        // Test the limits of double precision
        final maxPrecision = 1e-15; // Near the limit of double precision
        final result = maxPrecision.seconds;

        // Should handle gracefully without throwing
        expect(result, isA<Duration>());

        // Test with a more reasonable tiny value
        final tiny = 1e-9; // 1 nanosecond as seconds
        final tinyResult = tiny.seconds;
        expect(tinyResult.inMicroseconds,
            anyOf(0, 1)); // Should round to 0 or 1 microseconds
      });
    });

    group('Real-world usage scenarios', () {
      test('scientific measurements', () {
        // Simulate precise timing measurements
        final reactionTime = 0.147.seconds; // Average human reaction time
        expect(reactionTime.inMilliseconds, 147);
        expect(reactionTime.inMicroseconds, 147000);

        final lightSpeed = 299792458.0; // m/s
        final distanceToMoon = 384400000.0; // meters
        final timeToMoon = distanceToMoon / lightSpeed; // seconds
        final moonDuration = timeToMoon.seconds;
        expect(moonDuration.inSeconds,
            closeTo(1, 0.5)); // ~1.28 seconds, but allow wider range
      });

      test('athletic timing', () {
        // 100m world record: 9.58 seconds
        final worldRecord = 9.58.seconds;
        expect(worldRecord.inMilliseconds, 9580);
        expect(worldRecord.inMicroseconds, 9580000);

        // Marathon world record: 2:01:09 (7269 seconds)
        final marathonTime = (2 * 3600 + 1 * 60 + 9).toDouble().seconds;
        expect(marathonTime.inHours, 2);
        expect(marathonTime.inMinutes % 60, 1);
        expect(marathonTime.inSeconds % 60, 9);
      });

      test('cooking and timing precision', () {
        // Baking precision: 12.5 minutes
        final bakingTime = 12.5.minutes;
        expect(bakingTime.inMinutes, 12);
        expect(bakingTime.inSeconds % 60, 30);

        // Brewing tea: 3.75 minutes
        final teaTime = 3.75.minutes;
        expect(teaTime.inMinutes, 3);
        expect(teaTime.inSeconds % 60, 45);
      });

      test('work schedule calculations', () {
        // 8.5 hour workday
        final workDay = 8.5.hours;
        expect(workDay.inHours, 8);
        expect(workDay.inMinutes % 60, 30);

        // 37.5 hour work week
        final workWeek = 37.5.hours;
        expect(workWeek.inHours, 37);
        expect(workWeek.inMinutes % 60, 30);
      });
    });

    group('Performance and memory efficiency', () {
      test('repeated conversions maintain precision', () {
        final original = 3.14159.days;

        // Convert back and forth multiple times
        double value = 3.14159;
        for (int i = 0; i < 10; i++) {
          final duration = value.days;
          value = duration.inMicroseconds / Duration.microsecondsPerDay;
        }

        final finalDuration = value.days;
        expect(
            finalDuration.inMicroseconds, closeTo(original.inMicroseconds, 10));
      });

      test('large batch conversions', () {
        // Test converting many values efficiently
        final values = List.generate(1000, (i) => i * 0.001); // 0.000 to 0.999
        final durations = values.map((v) => v.seconds).toList();

        expect(durations.length, 1000);
        expect(durations.first, Duration.zero);
        expect(durations.last.inMilliseconds, 999);
      });
    });

    group('Gregorian calendar approximations', () {
      test('month approximation accuracy', () {
        // Test that the approximation is reasonable for typical use cases
        final oneMonth = 1.0.months;

        // Should be between shortest month (28 days) and longest month (31 days)
        expect(oneMonth.inDays, greaterThan(28));
        expect(oneMonth.inDays, lessThan(32));

        // 12 months should be close to 1 year
        final twelveMonths = 12.0.months;
        final oneYear = 1.0.years;
        expect(twelveMonths.inDays, closeTo(oneYear.inDays, 1));
      });

      test('year approximation includes leap year calculation', () {
        final oneYear = 1.0.years;

        // Should be more than a common year (365 days) but less than 366 days
        expect(oneYear.inDays, greaterThanOrEqualTo(365));
        expect(oneYear.asDays, greaterThan(365));
        expect(oneYear.inDays, lessThan(366));

        // Should be approximately the Gregorian mean: 365.2425 days
        expect(oneYear.inDays, closeTo(365.2425, 0.3));
      });

      test('decade and century scaling', () {
        final oneYear = 1.0.years;
        final oneDecade = 1.0.decades;
        final oneCentury = 1.0.centuries;

        // Decade should be exactly 10 years
        expect(oneDecade.inDays, TimePlusConsts.roundedDaysInDecade);
        expect(oneDecade.inDays, closeTo(oneYear.inDays * 10, 2));

        // Century should be exactly 100 years or 10 decades
        expect(
            oneCentury.inDays, closeTo(TimePlusConsts.roundedDaysInCentury, 2));
        expect(oneCentury.inDays,
            closeTo(TimePlusConsts.roundedDaysInDecade * 10, 4));
      });

      test('fractional approximations maintain proportionality', () {
        // Test that fractional values maintain correct proportional relationships
        final halfYear = 0.5.years;
        final quarterYear = 0.25.years;
        final fullYear = 1.0.years;

        expect(halfYear.inDays * 2, closeTo(fullYear.inDays, 1));
        expect(quarterYear.inDays * 4, closeTo(fullYear.inDays, 1));

        // Test months
        final halfMonth = 0.5.months;
        final fullMonth = 1.0.months;
        expect(halfMonth.inDays * 2, closeTo(fullMonth.inDays, 0.001));
      });
    });

    group('Comparison with standard Duration constructors', () {
      test('integer equivalency', () {
        // When using whole numbers, should match standard Duration constructors
        expect(5.0.days, equals(Duration(days: 5)));
        expect(3.0.hours, equals(Duration(hours: 3)));
        expect(45.0.minutes, equals(Duration(minutes: 45)));
        expect(30.0.seconds, equals(Duration(seconds: 30)));
        expect(500.0.milliseconds, equals(Duration(milliseconds: 500)));
        expect(2.0.weeks, equals(Duration(days: 14)));
      });

      test('fractional advantage over standard constructors', () {
        // Standard Duration can't handle 1.5 days directly
        expect(1.5.days, equals(Duration(days: 1, hours: 12)));
        expect(2.5.hours, equals(Duration(hours: 2, minutes: 30)));
        expect(1.5.minutes, equals(Duration(minutes: 1, seconds: 30)));
        expect(1.5.seconds, equals(Duration(seconds: 1, milliseconds: 500)));
        expect(1.5.weeks, equals(Duration(days: 10, hours: 12)));
      });

      test('approximation units not available in standard constructors', () {
        // Standard Duration has no direct support for months, years, decades, centuries
        // These extension methods provide approximations for these concepts

        // 1 month ≈ 30.44 days (cannot be expressed precisely with standard Duration)
        final oneMonth = 1.0.months;
        expect(oneMonth.inDays, closeTo(30, 1));
        expect(oneMonth.inDays,
            greaterThanOrEqualTo(30)); // Should be slightly more than 30

        // 1 year ≈ 365.24 days
        final oneYear = 1.0.years;
        expect(oneYear.inDays, closeTo(365, 1));
        expect(oneYear.inDays,
            greaterThanOrEqualTo(365)); // Should account for leap years

        // Demonstrate fractional approximations work
        expect(0.5.years.inDays, closeTo(183, 1)); // Half year
        expect(1.5.months.inDays, closeTo(46, 1)); // 1.5 months
      });
    });
  });
}
