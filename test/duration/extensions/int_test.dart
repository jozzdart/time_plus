import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('IntDurationExtension', () {
    group('Basic unit conversions', () {
      test('milliseconds conversion', () {
        expect(0.milliseconds, Duration.zero);
        expect(1.milliseconds, Duration(milliseconds: 1));
        expect(100.milliseconds, Duration(milliseconds: 100));
        expect(1000.milliseconds, Duration(seconds: 1));
        expect(1500.milliseconds, Duration(milliseconds: 1500));
        expect(60000.milliseconds, Duration(minutes: 1));
      });

      test('seconds conversion', () {
        expect(0.seconds, Duration.zero);
        expect(1.seconds, Duration(seconds: 1));
        expect(30.seconds, Duration(seconds: 30));
        expect(60.seconds, Duration(minutes: 1));
        expect(120.seconds, Duration(minutes: 2));
        expect(3600.seconds, Duration(hours: 1));
        expect(3661.seconds, Duration(hours: 1, minutes: 1, seconds: 1));
      });

      test('minutes conversion', () {
        expect(0.minutes, Duration.zero);
        expect(1.minutes, Duration(minutes: 1));
        expect(30.minutes, Duration(minutes: 30));
        expect(60.minutes, Duration(hours: 1));
        expect(90.minutes, Duration(hours: 1, minutes: 30));
        expect(1440.minutes, Duration(days: 1));
      });

      test('hours conversion', () {
        expect(0.hours, Duration.zero);
        expect(1.hours, Duration(hours: 1));
        expect(12.hours, Duration(hours: 12));
        expect(24.hours, Duration(days: 1));
        expect(36.hours, Duration(days: 1, hours: 12));
        expect(168.hours, Duration(days: 7));
      });

      test('days conversion', () {
        expect(0.days, Duration.zero);
        expect(1.days, Duration(days: 1));
        expect(7.days, Duration(days: 7));
        expect(30.days, Duration(days: 30));
        expect(365.days, Duration(days: 365));
      });
    });

    group('Negative values', () {
      test('negative milliseconds', () {
        expect((-1).milliseconds, Duration(milliseconds: -1));
        expect((-100).milliseconds, Duration(milliseconds: -100));
        expect((-1000).milliseconds, Duration(seconds: -1));
        expect((-5000).milliseconds, Duration(seconds: -5));
      });

      test('negative seconds', () {
        expect((-1).seconds, Duration(seconds: -1));
        expect((-30).seconds, Duration(seconds: -30));
        expect((-60).seconds, Duration(minutes: -1));
        expect((-3600).seconds, Duration(hours: -1));
      });

      test('negative minutes', () {
        expect((-1).minutes, Duration(minutes: -1));
        expect((-30).minutes, Duration(minutes: -30));
        expect((-60).minutes, Duration(hours: -1));
        expect((-1440).minutes, Duration(days: -1));
      });

      test('negative hours', () {
        expect((-1).hours, Duration(hours: -1));
        expect((-12).hours, Duration(hours: -12));
        expect((-24).hours, Duration(days: -1));
        expect((-48).hours, Duration(days: -2));
      });

      test('negative days', () {
        expect((-1).days, Duration(days: -1));
        expect((-7).days, Duration(days: -7));
        expect((-30).days, Duration(days: -30));
        expect((-365).days, Duration(days: -365));
      });
    });

    group('Large values', () {
      test('large milliseconds', () {
        expect(86400000.milliseconds, Duration(days: 1));
        expect(604800000.milliseconds, Duration(days: 7));
        expect(2592000000.milliseconds, Duration(days: 30));
      });

      test('large seconds', () {
        expect(86400.seconds, Duration(days: 1));
        expect(604800.seconds, Duration(days: 7));
        expect(2592000.seconds, Duration(days: 30));
        expect(31536000.seconds, Duration(days: 365));
      });

      test('large minutes', () {
        expect(525600.minutes, Duration(days: 365)); // Minutes in a year
        expect(43200.minutes, Duration(days: 30)); // Minutes in 30 days
        expect(10080.minutes, Duration(days: 7)); // Minutes in a week
      });

      test('large hours', () {
        expect(8760.hours, Duration(days: 365)); // Hours in a year
        expect(720.hours, Duration(days: 30)); // Hours in 30 days
        expect(168.hours, Duration(days: 7)); // Hours in a week
      });

      test('large days', () {
        expect(10000.days, Duration(days: 10000));
        expect(36500.days, Duration(days: 36500)); // ~100 years
        expect(365000.days, Duration(days: 365000)); // ~1000 years
      });
    });

    group('Mathematical operations and consistency', () {
      test('unit conversion consistency', () {
        // Test that different unit representations of same duration are equal
        expect(1000.milliseconds, 1.seconds);
        expect(60.seconds, 1.minutes);
        expect(60.minutes, 1.hours);
        expect(24.hours, 1.days);

        // Complex conversions
        expect(3600.seconds, 1.hours);
        expect(86400.seconds, 1.days);
        expect(1440.minutes, 1.days);
        expect(86400000.milliseconds, 1.days);
      });

      test('additive properties', () {
        // Test that sum of durations equals duration of sum
        expect(30.seconds + 30.seconds, 60.seconds);
        expect(30.minutes + 30.minutes, 1.hours);
        expect(12.hours + 12.hours, 1.days);
        expect(500.milliseconds + 500.milliseconds, 1.seconds);
      });

      test('multiplicative consistency', () {
        // Test that n * unit equals (n * 1).unit
        expect(2.seconds, (2 * 1).seconds);
        expect(5.minutes, (5 * 1).minutes);
        expect(3.hours, (3 * 1).hours);
        expect(4.days, (4 * 1).days);
        expect(10.milliseconds, (10 * 1).milliseconds);
      });

      test('cross-unit arithmetic', () {
        // Test mixed unit operations
        final duration1 = 1.hours + 30.minutes + 45.seconds;
        final duration2 = 90.minutes + 45.seconds;
        expect(duration1, duration2);

        final duration3 = 1.days + 2.hours + 3.minutes + 4.seconds;
        final expectedMs = 24 * 60 * 60 * 1000 + // 1 day in ms
            2 * 60 * 60 * 1000 + // 2 hours in ms
            3 * 60 * 1000 + // 3 minutes in ms
            4 * 1000; // 4 seconds in ms
        expect(duration3.inMilliseconds, expectedMs);
      });
    });

    group('Edge cases and boundary conditions', () {
      test('zero values', () {
        expect(0.milliseconds, Duration.zero);
        expect(0.seconds, Duration.zero);
        expect(0.minutes, Duration.zero);
        expect(0.hours, Duration.zero);
        expect(0.days, Duration.zero);

        // Verify all zero durations are equal
        expect(0.milliseconds, 0.seconds);
        expect(0.seconds, 0.minutes);
        expect(0.minutes, 0.hours);
        expect(0.hours, 0.days);
      });

      test('maximum int values', () {
        // Test with large integers that won't overflow in Duration constructor
        expect(999999.milliseconds, Duration(milliseconds: 999999));
        expect(999999.seconds, Duration(seconds: 999999));
        expect(99999.minutes, Duration(minutes: 99999));
        expect(9999.hours, Duration(hours: 9999));
        expect(999.days, Duration(days: 999));
      });

      test('time unit boundaries', () {
        // Test exact boundaries between units
        expect(999.milliseconds + 1.milliseconds, 1.seconds);
        expect(59.seconds + 1.seconds, 1.minutes);
        expect(59.minutes + 1.minutes, 1.hours);
        expect(23.hours + 1.hours, 1.days);
      });

      test('precision preservation', () {
        // Test that integer values preserve exact precision
        expect(1.milliseconds.inMicroseconds, 1000);
        expect(1.seconds.inMilliseconds, 1000);
        expect(1.minutes.inSeconds, 60);
        expect(1.hours.inMinutes, 60);
        expect(1.days.inHours, 24);
      });
    });

    group('Real-world scenarios', () {
      test('common time intervals', () {
        // Test common real-world durations
        expect(15.minutes, Duration(minutes: 15)); // Quarter hour
        expect(30.minutes, Duration(minutes: 30)); // Half hour
        expect(45.minutes, Duration(minutes: 45)); // Three quarters hour
        expect(90.minutes, Duration(hours: 1, minutes: 30)); // Hour and half

        // Work day
        expect(8.hours, Duration(hours: 8));

        // Week
        expect(7.days, Duration(days: 7));

        // Common timeouts
        expect(5.seconds, Duration(seconds: 5));
        expect(30.seconds, Duration(seconds: 30));
        expect(2.minutes, Duration(minutes: 2));
      });

      test('sports and timing', () {
        // Marathon time components
        expect(180.minutes, Duration(hours: 3)); // 3 hour marathon
        expect(
            42195.milliseconds,
            Duration(
                milliseconds: 42195)); // Marathon distance in ms (fictional)

        // Sprint times
        expect(10.seconds, Duration(seconds: 10)); // 100m sprint
        expect(200.milliseconds, Duration(milliseconds: 200)); // Reaction time
      });

      test('technology timeouts', () {
        // Network timeouts
        expect(30.seconds, Duration(seconds: 30));
        expect(5.minutes, Duration(minutes: 5));

        // Cache expiry
        expect(1.hours, Duration(hours: 1));
        expect(24.hours, Duration(days: 1));

        // Polling intervals
        expect(500.milliseconds, Duration(milliseconds: 500));
        expect(1.seconds, Duration(seconds: 1));
        expect(15.seconds, Duration(seconds: 15));
      });
    });

    group('Comparison operations', () {
      test('equality comparisons', () {
        expect(60.seconds == 1.minutes, isTrue);
        expect(60.minutes == 1.hours, isTrue);
        expect(24.hours == 1.days, isTrue);
        expect(1000.milliseconds == 1.seconds, isTrue);

        // Cross comparisons
        expect(3600.seconds == 1.hours, isTrue);
        expect(86400.seconds == 1.days, isTrue);
        expect(1440.minutes == 1.days, isTrue);
      });

      test('ordering comparisons', () {
        expect(30.seconds < 1.minutes, isTrue);
        expect(2.minutes > 1.minutes, isTrue);
        expect(23.hours < 1.days, isTrue);
        expect(25.hours > 1.days, isTrue);

        // Mixed unit comparisons
        expect(59.seconds < 1.minutes, isTrue);
        expect(61.seconds > 1.minutes, isTrue);
        expect(90.minutes > 1.hours, isTrue);
        expect(30.minutes < 1.hours, isTrue);
      });
    });

    group('String representation and debugging', () {
      test('duration string representations are meaningful', () {
        // Test that toString provides useful output
        final duration1 = 1.hours;
        final duration2 = 90.minutes;
        final duration3 = 3661.seconds; // 1 hour, 1 minute, 1 second

        expect(duration1.toString(), contains('1:00:00'));
        expect(duration2.toString(), contains('1:30:00'));
        expect(duration3.toString(), contains('1:01:01'));
      });

      test('inXXX getters work correctly', () {
        final complexDuration =
            1.days + 2.hours + 3.minutes + 4.seconds + 5.milliseconds;

        expect(complexDuration.inDays, 1);
        expect(complexDuration.inHours, 26); // 24 + 2
        expect(complexDuration.inMinutes, 1563); // 26 * 60 + 3
        expect(complexDuration.inSeconds, 93784); // 1563 * 60 + 4
        expect(complexDuration.inMilliseconds, 93784005); // 93784 * 1000 + 5
      });
    });
  });
}
