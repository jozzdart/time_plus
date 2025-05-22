import 'package:time_plus/time_plus.dart';

void main() {
  // DateTime Examples
  print('=== DateTime Examples ===\n');

  // Create a sample date
  final now = DateTime(2024, 2, 29, 15, 30, 45);
  print('Current date: $now');

  // Adding time units
  print('\n--- Adding Time Units ---');
  final tomorrow = now.addDay;
  final nextWeek = now.addWeek;
  final nextMonth = now.addMonth;
  final nextYear = now.addYear;
  print('Tomorrow: $tomorrow');
  print('Next week: $nextWeek');
  print('Next month: $nextMonth');
  print('Next year: $nextYear');

  // Comparing dates
  print('\n--- Comparing Dates ---');
  final otherDate = DateTime(2024, 2, 29, 15, 30, 50);
  print('Is same day: ${now.isSameDay(otherDate)}');
  print('Is same hour: ${now.isSameHour(otherDate)}');
  print('Is same minute: ${now.isSameMinute(otherDate)}');

  // Getting boundaries
  print('\n--- Date Boundaries ---');
  print('Start of day: ${now.startOfDay}');
  print('End of day: ${now.endOfDay}');
  print('Start of week: ${now.startOfWeek}');
  print('End of week: ${now.endOfWeek}');
  print('Start of month: ${now.startOfMonth}');
  print('End of month: ${now.endOfMonth}');

  // Leap year checks
  print('\n--- Leap Year Checks ---');
  print('Is leap year: ${now.isLeapYear}');
  print('Is leap month: ${now.isLeapMonth}');
  print('Is leap day: ${now.isLeapDay}');

  // Relative days
  print('\n--- Relative Days ---');
  print('Yesterday: ${now.yesterday}');
  print('Tomorrow: ${now.tomorrow}');
  print('Previous weekday: ${now.previousWeekday}');
  print('Next weekday: ${now.nextWeekday}');

  // Duration Examples
  print('\n=== Duration Examples ===\n');

  // Create a sample duration
  final duration = Duration(hours: 2, minutes: 30);
  print('Initial duration: $duration');

  // Adding time units
  print('\n--- Adding Time Units ---');
  final extendedDuration = duration.addHours(1).addMinutes(15);
  print('Extended duration: $extendedDuration');

  // Converting to whole units
  print('\n--- Converting to Whole Units ---');
  final longDuration = Duration(days: 750);
  print('Duration in years: ${longDuration.inYears}');
  print('Duration in months: ${longDuration.inMonths}');

  // Breaking down duration
  print('\n--- Breaking Down Duration ---');
  final complexDuration = Duration(days: 1, hours: 2, minutes: 45, seconds: 30);
  print('Days only: ${complexDuration.onlyDays}');
  print('Hours only: ${complexDuration.onlyHours}');
  print('Minutes only: ${complexDuration.onlyMinutes}');
  print('Seconds only: ${complexDuration.onlySeconds}');

  // Removing units
  print('\n--- Removing Units ---');
  final timeOfDay = complexDuration.withoutDays;
  print('Time of day: $timeOfDay');

  // Creating durations
  print('\n--- Creating Durations ---');
  final workout = DurationFrom.minutes(45);
  final breakTime = DurationFrom.week;
  print('Workout duration: $workout');
  print('Break duration: $breakTime');
}
