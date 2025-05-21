import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DurationAddTimeExtensions', () {
    const base = Duration();

    test('addMicroseconds', () {
      expect(base.addMicroseconds(123), Duration(microseconds: 123));
    });

    test('addMilliseconds', () {
      expect(base.addMilliseconds(123), Duration(milliseconds: 123));
    });

    test('addSeconds', () {
      expect(base.addSeconds(123), Duration(seconds: 123));
    });

    test('addMinutes', () {
      expect(base.addMinutes(123), Duration(minutes: 123));
    });

    test('addHours', () {
      expect(base.addHours(123), Duration(hours: 123));
    });

    test('addDays', () {
      expect(base.addDays(123), Duration(days: 123));
    });

    test('addWeeks', () {
      expect(base.addWeeks(2), Duration(days: 14));
    });

    test('addMonths', () {
      expect(base.addMonths(2), Duration(days: 60));
    });

    test('addYears', () {
      expect(base.addYears(2), Duration(days: 730));
    });

    test('addDecades', () {
      expect(base.addDecades(1), Duration(days: 3650));
    });

    test('addCenturies', () {
      expect(base.addCenturies(1), Duration(days: 36500));
    });

    test('addMicrosecond getter', () {
      expect(base.addMicrosecond, Duration(microseconds: 1));
    });

    test('addMillisecond getter', () {
      expect(base.addMillisecond, Duration(milliseconds: 1));
    });

    test('addSecond getter', () {
      expect(base.addSecond, Duration(seconds: 1));
    });

    test('addMinute getter', () {
      expect(base.addMinute, Duration(minutes: 1));
    });

    test('addHour getter', () {
      expect(base.addHour, Duration(hours: 1));
    });

    test('addDay getter', () {
      expect(base.addDay, Duration(days: 1));
    });

    test('addWeek getter', () {
      expect(base.addWeek, Duration(days: 7));
    });

    test('addMonth getter', () {
      expect(base.addMonth, Duration(days: 30));
    });

    test('addYear getter', () {
      expect(base.addYear, Duration(days: 365));
    });

    test('addDecade getter', () {
      expect(base.addDecade, Duration(days: 3650));
    });

    test('addCentury getter', () {
      expect(base.addCentury, Duration(days: 36500));
    });

    test('handles negative input', () {
      expect(base.addDays(-1), Duration(days: -1));
      expect(base.addWeeks(-1), Duration(days: -7));
      expect(base.addYears(-1), Duration(days: -365));
    });

    test('composed additions', () {
      final result = base.addDays(1).addHours(2).addMinutes(30).addSeconds(15);

      expect(result, Duration(days: 1, hours: 2, minutes: 30, seconds: 15));
    });

    test('zero additions return zero duration', () {
      expect(base.addDays(0), Duration.zero);
      expect(base.addYears(0), Duration.zero);
    });

    test('very large values do not overflow', () {
      expect(base.addCenturies(100), Duration(days: 36500 * 100));
    });

    test('very negative values do not overflow', () {
      expect(base.addCenturies(-100), Duration(days: -36500 * 100));
    });

    test('add and subtract cancel out', () {
      final d1 = base.addYears(5);
      final d2 = d1 + base.addYears(-5);
      expect(d2, Duration.zero);
    });

    test('addDay equals addDays(1)', () {
      expect(base.addDay, base.addDays(1));
      expect(base.addCentury, base.addCenturies(1));
    });

    test('addMonths produces expected day count', () {
      final expected = Duration(days: 3 * TimePlusDurationConsts.daysInMonth);
      expect(base.addMonths(3), expected);
    });

    test('negative equivalents of getter via subtract', () {
      final backwards = -base.addDay;
      expect(backwards, Duration(days: -1));
    });

    test('addYears is approximate and not leap-year safe', () {
      expect(base.addYears(4), Duration(days: 1460)); // 365 * 4
    });

    test('addDays returns same result as Duration + Duration', () {
      final result = base.addDays(3);
      final manual = base + Duration(days: 3);
      expect(result, manual);
    });

    test('compareTo shows larger duration after add', () {
      final result = base.addHours(1);
      expect(result.compareTo(base), greaterThan(0));
      expect(base.compareTo(result), lessThan(0));
    });

    test('negated result cancels out positive', () {
      final result = base.addWeeks(5);
      expect(result + -result, Duration.zero);
    });

    test('addDays result is not const', () {
      const d = Duration(days: 1);
      final result = d.addDays(1);
      expect(() => identical(result, const Duration(days: 2)), returnsNormally);
    });

    test('DateTime + addDays works correctly', () {
      final now = DateTime(2025, 1, 1);
      final result = now.add(base.addDays(5));
      expect(result, DateTime(2025, 1, 6));
    });

    test('maximum 64-bit microsecond range does not crash', () {
      final max = Duration(microseconds: 9223372036854775807);
      expect(() => max.addDays(1),
          returnsNormally); // may wrap but shouldn't crash
    });

    test('Duration from addDays equals manually created Duration', () {
      expect(base.addDays(10), equals(Duration(days: 10)));
      expect(base.addWeeks(1).hashCode, Duration(days: 7).hashCode);
    });

    test('chaining positive and negative returns expected result', () {
      final result = base.addDays(5).addDays(-3).addDays(1);
      expect(result, Duration(days: 3));
    });

    test('fuzz test: addDays with random input', () {
      for (int i = -1000; i <= 1000; i += 250) {
        expect(base.addDays(i), Duration(days: i));
      }
    });
  });
}
