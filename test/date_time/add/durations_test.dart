import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DateTimeAddDurationExtension', () {
    test('addMilliseconds adds correct duration', () {
      final base = DateTime(2024, 1, 1, 12, 0, 0);
      final result = base.addMilliseconds(500);
      expect(result, DateTime(2024, 1, 1, 12, 0, 0, 500));
    });

    test('addSeconds adds correct duration', () {
      final base = DateTime(2024, 1, 1, 12, 0, 0);
      final result = base.addSeconds(30);
      expect(result, DateTime(2024, 1, 1, 12, 0, 30));
    });

    test('addMinutes adds correct duration', () {
      final base = DateTime(2024, 1, 1, 12, 0, 0);
      final result = base.addMinutes(15);
      expect(result, DateTime(2024, 1, 1, 12, 15, 0));
    });

    test('addHours adds correct duration', () {
      final base = DateTime(2024, 1, 1, 12, 0, 0);
      final result = base.addHours(2);
      expect(result, DateTime(2024, 1, 1, 14, 0, 0));
    });

    test('addDays adds correct duration', () {
      final base = DateTime(2024, 1, 1);
      final result = base.addDays(7);
      expect(result, DateTime(2024, 1, 8));
    });

    test('addWeeks adds correct duration', () {
      final base = DateTime(2024, 1, 1);
      final result = base.addWeeks(3);
      expect(result, DateTime(2024, 1, 22));
    });

    test('addMillisecond adds exactly one millisecond', () {
      final base = DateTime(2024, 1, 1, 12, 0, 0);
      final result = base.addMillisecond;
      expect(result, DateTime(2024, 1, 1, 12, 0, 0, 1));
    });

    test('addSecond adds exactly one second', () {
      final base = DateTime(2024, 1, 1, 12, 0, 0);
      final result = base.addSecond;
      expect(result, DateTime(2024, 1, 1, 12, 0, 1));
    });

    test('addMinute adds exactly one minute', () {
      final base = DateTime(2024, 1, 1, 12, 0, 0);
      final result = base.addMinute;
      expect(result, DateTime(2024, 1, 1, 12, 1, 0));
    });

    test('addHour adds exactly one hour', () {
      final base = DateTime(2024, 1, 1, 12, 0, 0);
      final result = base.addHour;
      expect(result, DateTime(2024, 1, 1, 13, 0, 0));
    });

    test('addDay adds exactly one day', () {
      final base = DateTime(2024, 1, 1);
      final result = base.addDay;
      expect(result, DateTime(2024, 1, 2));
    });

    test('addWeek adds exactly one week', () {
      final base = DateTime(2024, 1, 1);
      final result = base.addWeek;
      expect(result, DateTime(2024, 1, 8));
    });

    test('adding multiple units works correctly', () {
      final base = DateTime(2024, 1, 1, 12, 0, 0);
      final result =
          base.addHours(2).addMinutes(30).addSeconds(15).addMilliseconds(500);
      expect(result, DateTime(2024, 1, 1, 14, 30, 15, 500));
    });

    test('adding negative durations works correctly', () {
      final base = DateTime(2024, 1, 1, 12, 0, 0);
      final result = base.addHours(-2);
      expect(result, DateTime(2024, 1, 1, 10, 0, 0));
    });

    test('adding zero duration returns same DateTime', () {
      final base = DateTime(2024, 1, 1, 12, 0, 0);
      final result = base.addHours(0);
      expect(result, base);
    });

    test('adding across month boundaries works correctly', () {
      final base = DateTime(2024, 1, 31, 23, 59, 59);
      final result = base.addSeconds(2);
      expect(result, DateTime(2024, 2, 1, 0, 0, 1));
    });

    test('adding across year boundaries works correctly', () {
      final base = DateTime(2024, 12, 31, 23, 59, 59);
      final result = base.addSeconds(2);
      expect(result, DateTime(2025, 1, 1, 0, 0, 1));
    });
  });
}
