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
