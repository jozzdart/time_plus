import 'package:test/test.dart';
import 'package:time_plus/time_plus.dart';

void main() {
  group('DateTimeIn.daysInMonth', () {
    group('Common year (non-leap year)', () {
      test('returns correct days for all months in 2023', () {
        expect(DateTime(2023, 1).daysInMonth, 31,
            reason: 'January should have 31 days');
        expect(DateTime(2023, 2).daysInMonth, 28,
            reason: 'February should have 28 days in non-leap year');
        expect(DateTime(2023, 3).daysInMonth, 31,
            reason: 'March should have 31 days');
        expect(DateTime(2023, 4).daysInMonth, 30,
            reason: 'April should have 30 days');
        expect(DateTime(2023, 5).daysInMonth, 31,
            reason: 'May should have 31 days');
        expect(DateTime(2023, 6).daysInMonth, 30,
            reason: 'June should have 30 days');
        expect(DateTime(2023, 7).daysInMonth, 31,
            reason: 'July should have 31 days');
        expect(DateTime(2023, 8).daysInMonth, 31,
            reason: 'August should have 31 days');
        expect(DateTime(2023, 9).daysInMonth, 30,
            reason: 'September should have 30 days');
        expect(DateTime(2023, 10).daysInMonth, 31,
            reason: 'October should have 31 days');
        expect(DateTime(2023, 11).daysInMonth, 30,
            reason: 'November should have 30 days');
        expect(DateTime(2023, 12).daysInMonth, 31,
            reason: 'December should have 31 days');
      });

      test('returns 28 for February in century years not divisible by 400', () {
        expect(DateTime(1900, 2).daysInMonth, 28,
            reason: '1900 is not a leap year');
        expect(DateTime(2100, 2).daysInMonth, 28,
            reason: '2100 is not a leap year');
        expect(DateTime(2200, 2).daysInMonth, 28,
            reason: '2200 is not a leap year');
        expect(DateTime(2300, 2).daysInMonth, 28,
            reason: '2300 is not a leap year');
      });

      test('returns 28 for February in regular non-leap years', () {
        expect(DateTime(2021, 2).daysInMonth, 28);
        expect(DateTime(2022, 2).daysInMonth, 28);
        expect(DateTime(2025, 2).daysInMonth, 28);
        expect(DateTime(2026, 2).daysInMonth, 28);
        expect(DateTime(2027, 2).daysInMonth, 28);
      });
    });

    group('Leap year', () {
      test('returns correct days for all months in 2024', () {
        expect(DateTime(2024, 1).daysInMonth, 31,
            reason: 'January should have 31 days');
        expect(DateTime(2024, 2).daysInMonth, 29,
            reason: 'February should have 29 days in leap year');
        expect(DateTime(2024, 3).daysInMonth, 31,
            reason: 'March should have 31 days');
        expect(DateTime(2024, 4).daysInMonth, 30,
            reason: 'April should have 30 days');
        expect(DateTime(2024, 5).daysInMonth, 31,
            reason: 'May should have 31 days');
        expect(DateTime(2024, 6).daysInMonth, 30,
            reason: 'June should have 30 days');
        expect(DateTime(2024, 7).daysInMonth, 31,
            reason: 'July should have 31 days');
        expect(DateTime(2024, 8).daysInMonth, 31,
            reason: 'August should have 31 days');
        expect(DateTime(2024, 9).daysInMonth, 30,
            reason: 'September should have 30 days');
        expect(DateTime(2024, 10).daysInMonth, 31,
            reason: 'October should have 31 days');
        expect(DateTime(2024, 11).daysInMonth, 30,
            reason: 'November should have 30 days');
        expect(DateTime(2024, 12).daysInMonth, 31,
            reason: 'December should have 31 days');
      });

      test('returns 29 for February in century years divisible by 400', () {
        expect(DateTime(2000, 2).daysInMonth, 29,
            reason: '2000 is a leap year');
        expect(DateTime(2400, 2).daysInMonth, 29,
            reason: '2400 is a leap year');
        expect(DateTime(1600, 2).daysInMonth, 29,
            reason: '1600 is a leap year');
      });

      test('returns 29 for February in regular leap years', () {
        expect(DateTime(2020, 2).daysInMonth, 29);
        expect(DateTime(2028, 2).daysInMonth, 29);
        expect(DateTime(2032, 2).daysInMonth, 29);
        expect(DateTime(2036, 2).daysInMonth, 29);
        expect(DateTime(2040, 2).daysInMonth, 29);
      });
    });

    group('Day independence', () {
      test('returns same result regardless of day in month', () {
        // Test February in leap year
        expect(DateTime(2024, 2, 1).daysInMonth, 29);
        expect(DateTime(2024, 2, 15).daysInMonth, 29);
        expect(DateTime(2024, 2, 29).daysInMonth, 29);

        // Test February in non-leap year
        expect(DateTime(2023, 2, 1).daysInMonth, 28);
        expect(DateTime(2023, 2, 14).daysInMonth, 28);
        expect(DateTime(2023, 2, 28).daysInMonth, 28);

        // Test 31-day month
        expect(DateTime(2023, 1, 1).daysInMonth, 31);
        expect(DateTime(2023, 1, 15).daysInMonth, 31);
        expect(DateTime(2023, 1, 31).daysInMonth, 31);

        // Test 30-day month
        expect(DateTime(2023, 4, 1).daysInMonth, 30);
        expect(DateTime(2023, 4, 15).daysInMonth, 30);
        expect(DateTime(2023, 4, 30).daysInMonth, 30);
      });
    });

    group('Time independence', () {
      test('returns same result regardless of time of day', () {
        expect(DateTime(2024, 2, 15, 0, 0, 0).daysInMonth, 29);
        expect(DateTime(2024, 2, 15, 12, 30, 45).daysInMonth, 29);
        expect(DateTime(2024, 2, 15, 23, 59, 59).daysInMonth, 29);

        expect(DateTime(2023, 2, 15, 0, 0, 0).daysInMonth, 28);
        expect(DateTime(2023, 2, 15, 12, 30, 45).daysInMonth, 28);
        expect(DateTime(2023, 2, 15, 23, 59, 59).daysInMonth, 28);
      });
    });

    group('February leap year edge cases', () {
      test('correctly handles February across different leap year types', () {
        // Regular leap years (divisible by 4, not by 100)
        expect(DateTime(2020, 2).daysInMonth, 29);
        expect(DateTime(2024, 2).daysInMonth, 29);
        expect(DateTime(2028, 2).daysInMonth, 29);

        // Century years divisible by 400 (leap years)
        expect(DateTime(2000, 2).daysInMonth, 29);
        expect(DateTime(2400, 2).daysInMonth, 29);

        // Century years not divisible by 400 (not leap years)
        expect(DateTime(1900, 2).daysInMonth, 28);
        expect(DateTime(2100, 2).daysInMonth, 28);
        expect(DateTime(2200, 2).daysInMonth, 28);
        expect(DateTime(2300, 2).daysInMonth, 28);

        // Regular non-leap years
        expect(DateTime(2021, 2).daysInMonth, 28);
        expect(DateTime(2022, 2).daysInMonth, 28);
        expect(DateTime(2023, 2).daysInMonth, 28);
        expect(DateTime(2025, 2).daysInMonth, 28);
      });
    });

    group('Historical and future dates', () {
      test('works correctly for historical dates', () {
        expect(DateTime(1900, 1).daysInMonth, 31);
        expect(DateTime(1900, 2).daysInMonth, 28); // Not a leap year
        expect(DateTime(1900, 4).daysInMonth, 30);

        expect(DateTime(1600, 2).daysInMonth, 29); // Leap year
        expect(DateTime(1700, 2).daysInMonth, 28); // Not a leap year
        expect(DateTime(1800, 2).daysInMonth, 28); // Not a leap year
      });

      test('works correctly for future dates', () {
        expect(DateTime(2100, 1).daysInMonth, 31);
        expect(DateTime(2100, 2).daysInMonth, 28); // Not a leap year
        expect(DateTime(2100, 4).daysInMonth, 30);

        expect(DateTime(2400, 2).daysInMonth, 29); // Leap year
        expect(DateTime(2500, 2).daysInMonth, 28); // Not a leap year
      });
    });

    group('All months comprehensive test', () {
      test('verifies correct day counts for all 12 months', () {
        const expectedDaysCommonYear = [
          31,
          28,
          31,
          30,
          31,
          30,
          31,
          31,
          30,
          31,
          30,
          31
        ];
        const expectedDaysLeapYear = [
          31,
          29,
          31,
          30,
          31,
          30,
          31,
          31,
          30,
          31,
          30,
          31
        ];

        // Test common year
        for (int month = 1; month <= 12; month++) {
          expect(
            DateTime(2023, month).daysInMonth,
            expectedDaysCommonYear[month - 1],
            reason:
                'Month $month in common year should have ${expectedDaysCommonYear[month - 1]} days',
          );
        }

        // Test leap year
        for (int month = 1; month <= 12; month++) {
          expect(
            DateTime(2024, month).daysInMonth,
            expectedDaysLeapYear[month - 1],
            reason:
                'Month $month in leap year should have ${expectedDaysLeapYear[month - 1]} days',
          );
        }
      });
    });

    group('Boundary conditions', () {
      test('works with minimum valid month', () {
        expect(DateTime(2023, 1).daysInMonth, 31);
        expect(DateTime(2024, 1).daysInMonth, 31);
      });

      test('works with maximum valid month', () {
        expect(DateTime(2023, 12).daysInMonth, 31);
        expect(DateTime(2024, 12).daysInMonth, 31);
      });
    });

    group('UTC and local time consistency', () {
      test('returns same result for UTC and local time', () {
        final local = DateTime(2024, 2, 15, 12, 30);
        final utc = DateTime.utc(2024, 2, 15, 12, 30);

        expect(local.daysInMonth, utc.daysInMonth);
        expect(local.daysInMonth, 29);
        expect(utc.daysInMonth, 29);
      });
    });

    group('Performance and edge year tests', () {
      test('handles very early years correctly', () {
        expect(DateTime(1, 1).daysInMonth, 31);
        expect(DateTime(1, 2).daysInMonth, 28); // Year 1 is not a leap year
        expect(DateTime(4, 2).daysInMonth, 29); // Year 4 is a leap year
      });

      test('handles year transitions correctly', () {
        expect(DateTime(1999, 12).daysInMonth, 31);
        expect(DateTime(2000, 1).daysInMonth, 31);
        expect(DateTime(2000, 2).daysInMonth, 29); // 2000 is a leap year
      });
    });
  });
}
