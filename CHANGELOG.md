## 0.0.6

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

## 0.0.5

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
