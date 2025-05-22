## 1.1.6

- Added `DateTimeNextExtensions` extension on `DateTime` class:
  - Advanced date navigation methods:
    - `nextWeekdayTime`: Find the next occurrence of a specific weekday with optional time
    - `nextTimeOfDay`: Find the next time matching a specific time of day

## 1.1.5

- Added `DateTimeWeekdayExtensions` extension on `DateTime` class:
  - Day navigation getters:
    - `yesterday`: Returns start of previous day
    - `tomorrow`: Returns start of next day
  - Weekday navigation getters:
    - `nextWeekday`: Returns weekday number of next day
    - `previousWeekday`: Returns weekday number of previous day

## 1.1.4

Added detailed README for enhanced user experience.

### Added

- README with:
  - Emoji-based Table of Contents
  - Categorized DateTime and Duration extensions
  - Code examples for features
  - Emoji icons for readability
  - "Back to Top" links
  - Sections on:
    - DateTime: Time units, precision, boundaries, leap year
    - Duration: Time units, factory methods, conversion, breakdown, removal
  - Examples with use cases, edge cases, chainable operations, calendar-aware calculations
  - Support: License, support link, branding

## 1.1.3

Added comprehensive DateTime boundary functionality with extensive test coverage.

### Added

- `DateTimeBoundariesExtensions` extension on `DateTime` class:
  - New getters for precise temporal boundaries:
    - `startOfMillisecond` / `endOfMillisecond`: Microsecond-level boundaries
    - `startOfSecond` / `endOfSecond`: Millisecond-level boundaries
    - `startOfMinute` / `endOfMinute`: Second-level boundaries
    - `startOfHour` / `endOfHour`: Minute-level boundaries
    - `startOfDay` / `endOfDay`: Hour-level boundaries
    - `startOfWeek` / `endOfWeek`: Day-level boundaries (Monday-based)
    - `startOfMonth` / `endOfMonth`: Day-level boundaries
    - `startOfYear` / `endOfYear`: Month-level boundaries
    - `startOfDecade` / `endOfDecade`: Year-level boundaries (10-year spans)
    - `startOfCentury` / `endOfCentury`: Year-level boundaries (100-year spans)
  - Smart handling of edge cases:
    - Week transitions across month boundaries
    - Month transitions with varying lengths
    - Year transitions including leap years
    - Decade and century transitions
    - Timezone preservation
  - Comprehensive test suite covering:
    - All boundary types and transitions
    - Leap year scenarios
    - Month length variations
    - Week boundary calculations
    - Timezone consistency
    - Microsecond precision
    - Cross-century transitions

## 1.1.2

Added comprehensive temporal precision comparison functionality with extensive test coverage.

### Added

- `DateTimeIsSameExtensions` extension on `DateTime` class:
  - New methods for precise temporal comparison:
    - `isSameCentury`: Compare dates at century level
    - `isSameDecade`: Compare dates at decade level
    - `isSameYear`: Compare dates at year level
    - `isSameMonth`: Compare dates at month level
    - `isSameDay`: Compare dates at day level
    - `isSameHour`: Compare dates at hour level
    - `isSameMinute`: Compare dates at minute level
    - `isSameSecond`: Compare dates at second level
    - `isSameMillisecond`: Compare dates at millisecond level
    - `isSameMicrosecond`: Compare dates at microsecond level
  - Smart handling of edge cases:
    - Century transitions (e.g., 1999-2000)
    - Decade boundaries
    - Year boundaries
    - Month transitions
    - Day boundaries
    - Leap year dates
  - Comprehensive test suite covering:
    - All precision levels
    - Boundary conditions
    - Leap year scenarios
    - Time zone consistency
    - Edge case handling

## 1.1.1

Added comprehensive leap year functionality with extensive test coverage.

- New getters for leap year detection:
  - `isLeapYear`: Determines if a year is a leap year following the Gregorian calendar rules
  - `isLeapMonth`: Identifies February in leap years
  - `isLeapDay`: Identifies February 29th in leap years
- Smart handling of edge cases:
  - Years divisible by 4 but not by 100
  - Years divisible by 100 but not by 400
  - Years divisible by 400
  - Invalid date combinations
- Comprehensive test suite

## 1.1.0

Comprehensive DateTime extensions for adding time units with proper handling of edge cases and calendar rules.

- `DateTimeAddDurationExtension` extension on `DateTime` class:

  - Methods for adding standard time units:
    - `addMilliseconds`: Add milliseconds with precise control
    - `addSeconds`: Add seconds with proper overflow handling
    - `addMinutes`: Add minutes with automatic hour adjustment
    - `addHours`: Add hours with automatic day adjustment
    - `addDays`: Add days with proper month/year handling
    - `addWeeks`: Add weeks using standard 7-day calculation
  - Convenience getters for single unit additions:
    - `addMillisecond`: Add exactly one millisecond
    - `addSecond`: Add exactly one second
    - `addMinute`: Add exactly one minute
    - `addHour`: Add exactly one hour
    - `addDay`: Add exactly one day
    - `addWeek`: Add exactly one week

- `DateTimeAddMonthsAndYearsExtension` extension on `DateTime` class:

  - Methods for calendar-aware additions:
    - `addMonths`: Add months with proper day clamping
    - `addYears`: Add years with leap year handling
  - Convenience getters:
    - `addMonth`: Add exactly one month
    - `addYear`: Add exactly one year
  - Smart handling of edge cases:
    - Month overflow (e.g., January 31 + 1 month)
    - Leap year transitions
    - Year boundaries
    - Invalid date combinations

- `DateTimeAddExtendingYearsExtension` extension on `DateTime` class:

  - Methods for long-term additions:
    - `addDecades`: Add decades with proper year calculation
    - `addCenturies`: Add centuries with proper decade calculation
  - Convenience getters:
    - `addDecade`: Add exactly one decade
    - `addCentury`: Add exactly one century

- Added Comprehensive tests and detailed API documentation with examples, edge case handling, and best practices.

- Refactored time constants into a unified `TimePlusConsts` class, removing the separate `TimePlusDurationConsts` for better maintainability and consistency across the library.

## 1.0.0

Added duration remainder extraction functionality with comprehensive test coverage.

### Added

- `DurationWithoutExtensions` extension on `Duration` class:
  - New getters for extracting remainders after removing complete time units:
    - `withoutDays`: Returns remainder after removing complete days
    - `withoutHours`: Returns remainder after removing complete hours
    - `withoutMinutes`: Returns remainder after removing complete minutes
    - `withoutSeconds`: Returns remainder after removing complete seconds
    - `withoutMilliseconds`: Returns remainder after removing complete milliseconds
  - Efficient internal calculation method for remainder extraction
  - Full support for both positive and negative durations
  - Handles edge cases including:
    - Zero durations
    - Maximum/minimum duration values
    - Mixed positive/negative components
    - Very large duration values
    - Boundary values
    - Complex multi-unit combinations
  - Comprehensive test suite for all remainder extraction methods and edge cases

## 0.0.4

Added comprehensive duration conversion getters for extended time units.

### Added

- `DurationInGettersExtensions` extension on `Duration` class:
  - Integer-based getters for full time units:
    - `fullWeeks`: Get complete weeks (7 days each)
    - `fullMonths`: Get complete months (30 days each)
    - `fullYears`: Get complete years (365 days each)
    - `fullDecades`: Get complete decades (3650 days each)
    - `fullCenturies`: Get complete centuries (36500 days each)
  - Double-based getters for precise time unit conversion:
    - `asWeeks`: Convert to weeks with decimal precision
    - `asMonths`: Convert to months with decimal precision
    - `asYears`: Convert to years with decimal precision
    - `asDecades`: Convert to decades with decimal precision
    - `asCenturies`: Convert to centuries with decimal precision
  - Full support for both positive and negative durations
  - Comprehensive test coverage for all conversion scenarios

## 0.0.3

Added duration unit extraction functionality with comprehensive test coverage.

### Added

- `DurationOnlyExtensions` extension on `Duration` class:
  - New getters for extracting individual time units:
    - `onlyMicroseconds`: Extracts microseconds excluding full milliseconds
    - `onlyMilliseconds`: Extracts milliseconds excluding full seconds
    - `onlySeconds`: Extracts seconds excluding full minutes
    - `onlyMinutes`: Extracts minutes excluding full hours
    - `onlyHours`: Extracts hours excluding full days
    - `onlyDays`: Extracts full days
  - Efficient internal calculation method for unit extraction
  - Full support for both positive and negative durations
  - Comprehensive test suite for `DurationOnlyExtensions`:

## 0.0.2

Added comprehensive test coverage and duration addition extensions.

### Added

- `DurationAddTimeExtensions` extension on `Duration` class:
  - Methods for adding time units: `addMicroseconds`, `addMilliseconds`, `addSeconds`, `addMinutes`, `addHours`, `addDays`, `addWeeks`, `addMonths`, `addYears`, `addDecades`, `addCenturies`
  - Convenience getters for single unit additions: `addMicrosecond`, `addMillisecond`, `addSecond`, `addMinute`, `addHour`, `addDay`, `addWeek`, `addMonth`, `addYear`, `addDecade`, `addCentury`
  - Support for negative values and zero inputs
  - Full composability with existing Duration operations

### Testing

- Comprehensive test suite for all components:
  - Unit tests for `TimePlusDurationConsts` verifying all constant values
  - Extensive tests for `DurationFrom` methods and constants
  - Complete test coverage for `DurationAddTimeExtensions`

## 0.0.1

Initial release of time_plus package with core duration functionality.

### Added

- `TimePlusDurationConsts` class with essential time unit constants:

  - Basic time units: days in week (7), month (30), year (365)
  - Extended time units: decade (10 years), century (100 years)
  - Derived constants for days in decade and century

- `DurationFrom` utility class with comprehensive duration creation methods:
  - Factory methods for all time units from microseconds to centuries
  - Constant duration instances for all time units
  - Support for standard units (microseconds, milliseconds, seconds, minutes, hours, days)
  - Support for extended units (weeks, months, years, decades, centuries)
