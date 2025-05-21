import 'package:test/test.dart';
import 'package:time_plus/duration/without.dart';

void main() {
  group('DurationWithout', () {
    group('withoutDays', () {
      test('removes days from duration', () {
        final duration = Duration(days: 2, hours: 3, minutes: 4, seconds: 5);
        final result = duration.withoutDays;
        expect(result.inDays, 0);
        expect(result.inHours, 3);
        expect(result.inMinutes, 184); // 3 hours * 60 + 4 minutes
        expect(result.inSeconds, 11045); // 184 minutes * 60 + 5 seconds
      });

      test('handles zero duration', () {
        final duration = Duration.zero;
        final result = duration.withoutDays;
        expect(result, Duration.zero);
      });

      test('handles negative duration', () {
        final duration = Duration(days: -2, hours: 3, minutes: 4, seconds: 5);
        final result = duration.withoutDays;
        expect(result.inDays, 0);
        expect(result.inHours, 3);
        expect(result.inMinutes, 184);
        expect(result.inSeconds, 11045);
      });
    });

    group('withoutHours', () {
      test('removes hours from duration', () {
        final duration = Duration(hours: 2, minutes: 3, seconds: 4);
        final result = duration.withoutHours;
        expect(result.inHours, 0);
        expect(result.inMinutes, 3);
        expect(result.inSeconds, 184); // 3 minutes * 60 + 4 seconds
      });

      test('handles zero duration', () {
        final duration = Duration.zero;
        final result = duration.withoutHours;
        expect(result, Duration.zero);
      });

      test('handles negative duration', () {
        final duration = Duration(hours: -2, minutes: 3, seconds: 4);
        final result = duration.withoutHours;
        expect(result.inHours, 0);
        expect(result.inMinutes, 3);
        expect(result.inSeconds, 184);
      });
    });

    group('withoutMinutes', () {
      test('removes minutes from duration', () {
        final duration = Duration(minutes: 2, seconds: 3, milliseconds: 4);
        final result = duration.withoutMinutes;
        expect(result.inMinutes, 0);
        expect(result.inSeconds, 3);
        expect(
            result.inMilliseconds, 3004); // 3 seconds * 1000 + 4 milliseconds
      });

      test('handles zero duration', () {
        final duration = Duration.zero;
        final result = duration.withoutMinutes;
        expect(result, Duration.zero);
      });

      test('handles negative duration', () {
        final duration = Duration(minutes: -2, seconds: 3, milliseconds: 4);
        final result = duration.withoutMinutes;
        expect(result.inMinutes, 0);
        expect(result.inSeconds, 3);
        expect(result.inMilliseconds, 3004);
      });
    });

    group('withoutSeconds', () {
      test('removes seconds from duration', () {
        final duration = Duration(seconds: 2, milliseconds: 3, microseconds: 4);
        final result = duration.withoutSeconds;
        expect(result.inSeconds, 0);
        expect(result.inMilliseconds, 3);
        expect(result.inMicroseconds,
            3004); // 3 milliseconds * 1000 + 4 microseconds
      });

      test('handles zero duration', () {
        final duration = Duration.zero;
        final result = duration.withoutSeconds;
        expect(result, Duration.zero);
      });

      test('handles negative duration', () {
        final duration =
            Duration(seconds: -2, milliseconds: 3, microseconds: 4);
        final result = duration.withoutSeconds;
        expect(result.inSeconds, 0);
        expect(result.inMilliseconds, 3);
        expect(result.inMicroseconds, 3004);
      });
    });

    group('withoutMilliseconds', () {
      test('removes milliseconds from duration', () {
        final duration = Duration(milliseconds: 2, microseconds: 3);
        final result = duration.withoutMilliseconds;
        expect(result.inMilliseconds, 0);
        expect(result.inMicroseconds, 3);
      });

      test('handles zero duration', () {
        final duration = Duration.zero;
        final result = duration.withoutMilliseconds;
        expect(result, Duration.zero);
      });

      test('handles negative duration', () {
        final duration = Duration(milliseconds: -2, microseconds: 3);
        final result = duration.withoutMilliseconds;
        expect(result.inMilliseconds, 0);
        expect(result.inMicroseconds, 3);
      });
    });

    group('edge cases', () {
      test('handles maximum duration values', () {
        final duration = Duration(microseconds: Duration.microsecondsPerDay);
        expect(duration.withoutDays, Duration.zero);
        expect(duration.withoutHours, Duration.zero);
        expect(duration.withoutMinutes, Duration.zero);
        expect(duration.withoutSeconds, Duration.zero);
        expect(duration.withoutMilliseconds, Duration.zero);
      });

      test('handles minimum duration values', () {
        final duration = Duration(microseconds: -Duration.microsecondsPerDay);
        expect(duration.withoutDays, Duration.zero);
        expect(duration.withoutHours, Duration.zero);
        expect(duration.withoutMinutes, Duration.zero);
        expect(duration.withoutSeconds, Duration.zero);
        expect(duration.withoutMilliseconds, Duration.zero);
      });
    });

    group('precision edge cases', () {
      test('handles microsecond precision correctly', () {
        final duration = Duration(microseconds: 1);
        expect(duration.withoutMilliseconds.inMicroseconds, 1);
        expect(duration.withoutSeconds.inMicroseconds, 1);
        expect(duration.withoutMinutes.inMicroseconds, 1);
        expect(duration.withoutHours.inMicroseconds, 1);
        expect(duration.withoutDays.inMicroseconds, 1);
      });

      test('handles millisecond precision correctly', () {
        final duration = Duration(milliseconds: 1);
        expect(duration.withoutMilliseconds.inMicroseconds, 0);
        expect(duration.withoutSeconds.inMicroseconds, 1000);
        expect(duration.withoutMinutes.inMicroseconds, 1000);
        expect(duration.withoutHours.inMicroseconds, 1000);
        expect(duration.withoutDays.inMicroseconds, 1000);
      });
    });

    group('mixed positive/negative components', () {
      test('handles mixed positive/negative days and hours', () {
        final duration = Duration(days: 1, hours: -2);
        final result = duration.withoutDays;
        expect(result.inHours, 22); // 24 - 2 = 22 hours
      });

      test('handles mixed positive/negative hours and minutes', () {
        final duration = Duration(hours: 1, minutes: -2);
        final result = duration.withoutHours;
        expect(result.inMinutes, 58); // 60 - 2 = 58 minutes
      });

      test('handles mixed positive/negative minutes and seconds', () {
        final duration = Duration(minutes: 1, seconds: -2);
        final result = duration.withoutMinutes;
        expect(result.inSeconds, 58); // 60 - 2 = 58 seconds
      });
    });

    group('very large durations', () {
      test('handles very large day values', () {
        final duration = Duration(days: 365 * 100); // 100 years
        final result = duration.withoutDays;
        expect(result.inDays, 0);
        expect(result.inHours, 0);
      });

      test('handles very large hour values', () {
        final duration = Duration(hours: 24 * 365 * 100); // 100 years in hours
        final result = duration.withoutHours;
        expect(result.inHours, 0);
        expect(result.inMinutes, 0);
      });
    });

    group('boundary values', () {
      test('handles values just below unit boundaries', () {
        final duration =
            Duration(microseconds: Duration.microsecondsPerDay - 1);
        expect(duration.withoutDays.inMicroseconds,
            Duration.microsecondsPerDay - 1);

        final duration2 =
            Duration(microseconds: Duration.microsecondsPerHour - 1);
        expect(duration2.withoutHours.inMicroseconds,
            Duration.microsecondsPerHour - 1);
      });

      test('handles values just above unit boundaries', () {
        final duration =
            Duration(microseconds: Duration.microsecondsPerDay + 1);
        expect(duration.withoutDays.inMicroseconds, 1);

        final duration2 =
            Duration(microseconds: Duration.microsecondsPerHour + 1);
        expect(duration2.withoutHours.inMicroseconds, 1);
      });
    });

    group('multiple unit combinations', () {
      test('handles complex duration with all units', () {
        final duration = Duration(
          days: 1,
          hours: 2,
          minutes: 3,
          seconds: 4,
          milliseconds: 5,
          microseconds: 6,
        );

        final withoutDays = duration.withoutDays;
        expect(withoutDays.inDays, 0);
        expect(withoutDays.inHours, 2);
        expect(withoutDays.inMinutes, 123); // 2 hours * 60 + 3 minutes
        expect(withoutDays.inSeconds, 7384); // 123 minutes * 60 + 4 seconds
        expect(withoutDays.inMilliseconds,
            7384005); // 7384 seconds * 1000 + 5 milliseconds
        expect(withoutDays.inMicroseconds,
            7384005006); // 7384005 milliseconds * 1000 + 6 microseconds
      });

      test('handles complex negative duration with all units', () {
        final duration = Duration(
          days: -1,
          hours: -2,
          minutes: -3,
          seconds: -4,
          milliseconds: -5,
          microseconds: -6,
        );

        final withoutDays = duration.withoutDays;

        // All full days removed:
        expect(withoutDays.inDays, 0);

        // Total microseconds remainder
        expect(withoutDays.inMicroseconds, 79015994994);

        // Conversions from that:
        expect(withoutDays.inMilliseconds, 79015994); // 79 015 994 994 ~/ 1 000
        expect(withoutDays.inSeconds, 79015); // 79 015 994 994 ~/ 1 000 000
        expect(withoutDays.inMinutes, 1316); // 79 015 994 994 ~/ 60 000 000
        expect(withoutDays.inHours, 21); // 79 015 994 994 ~/ 3 600 000 000

        // All still less than one full day
        expect(withoutDays.inDays, 0);
      });
    });

    group('special cases', () {
      test('handles duration with only microseconds', () {
        final duration = Duration(microseconds: 999);
        expect(duration.withoutMilliseconds.inMicroseconds, 999);
        expect(duration.withoutSeconds.inMicroseconds, 999);
        expect(duration.withoutMinutes.inMicroseconds, 999);
        expect(duration.withoutHours.inMicroseconds, 999);
        expect(duration.withoutDays.inMicroseconds, 999);
      });

      test('handles duration with only milliseconds', () {
        final duration = Duration(milliseconds: 999);
        expect(duration.withoutMilliseconds.inMicroseconds, 0);
        expect(duration.withoutSeconds.inMicroseconds, 999000);
        expect(duration.withoutMinutes.inMicroseconds, 999000);
        expect(duration.withoutHours.inMicroseconds, 999000);
        expect(duration.withoutDays.inMicroseconds, 999000);
      });

      test('handles duration with only seconds', () {
        final duration = Duration(seconds: 59);

        // Stripping full seconds and smaller:
        expect(duration.withoutMilliseconds.inMicroseconds, 0);
        expect(duration.withoutSeconds.inMicroseconds, 0);

        // Stripping full minutes, hours, days:
        expect(duration.withoutMinutes.inMicroseconds, 59000000);
        expect(duration.withoutHours.inMicroseconds, 59000000);
        expect(duration.withoutDays.inMicroseconds, 59000000);
      });
    });
  });
}
