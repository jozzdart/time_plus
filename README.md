![img](https://i.imgur.com/vhAP7NO.png)

<h3 align="center"><i>Make every microsecond count.</i></h3>
<p align="center">
        <img src="https://img.shields.io/codefactor/grade/github/jozzzzep/time_plus/main?style=flat-square">
        <img src="https://img.shields.io/github/license/jozzzzep/time_plus?style=flat-square">
        <img src="https://img.shields.io/pub/points/time_plus?style=flat-square">
        <img src="https://img.shields.io/pub/v/time_plus?style=flat-square">
        
</p>
<p align="center">
  <a href="https://buymeacoffee.com/yosefd99v" target="https://buymeacoffee.com/yosefd99v">
    <img src="https://img.shields.io/badge/Buy%20me%20a%20coffee-Support (:-blue?logo=buymeacoffee&style=flat-square" />
  </a>
</p>

Stop wrestling with `DateTime` and `Duration`. `time_plus` gives you the tools you wish Dart had built in—add time units, break durations down, convert across scales, and do it all with a clear, predictable API. No dependencies. Just useful extensions that make working with time easier.

## Table of Contents

#### 📅 `DateTime`

- [**add**](#-add--add-time-to-a-datetime) – Add time units to `DateTime` from milliseconds to centuries with `.addX()` or `.addX` getters.
- [**isSame**](#-issame--compare-temporal-precision) – Compare two dates by year, month, day, hour, to microseconds using `isSameX()`.
- [**startOf / endOf**](#-startof--endof--datetime-boundaries) – Get start or end of time units: minute, hour, day, week, month, year.
- [**next**](#️-next--find-the-next-matching-datetime) – Find the next matching `DateTime` by weekday or time of day.
- [**leap**](#-leap--leap-year-month-and-day-detection) – Check if `DateTime` is in a leap year, leap month, or on leap day (Feb 29).
- [**yesterday / tomorrow**](#-yesterday--tomorrow--relative-day-helpers) – Get yesterday or tomorrow with `.yesterday` or `.tomorrow` getters.

#### ⏱️ `Duration`

- [**add**](#-add--add-time-units-to-a-duration) – Chain any time unit, from microseconds to centuries, with `.addX()` or `.addX` getters.
- [**in**](#-in--convert-duration-to-whole-units) – Convert durations into whole units like `inWeeks`, `inYears`, or `inCenturies`.
- [**only**](#-only--break-down-duration-by-remaining-units) – Extract the remainder after subtracting larger units (e.g. `onlyMinutes`, `onlySeconds`).
- [**without**](#-without--remove-full-units-from-a-duration) – Strip full units to isolate what’s left (e.g. time since midnight).
- [**Factories**](#️-factories--create-durations-from-any-unit) – Create durations from any unit or use built-in constants like `DurationFrom.year`.

## Why Use `time_plus`?

✅ **Zero dependencies** – Pure Dart. No setup, no third-party overhead.  
✅ **Lightweight & efficient** – Minimal footprint with production-safe performance.  
✅ **Powerful time utilities** – Add, compare, normalize, and decompose time with confidence.  
✅ **Production-grade & tested** – Built for reliability with thorough test coverage.

- **Ideal for:**
  - 🗓 **Calendar logic** – Scheduling, planning, date math, and recurring events
  - 🧮 **Data handling** – Grouping, filtering, and comparing `DateTime` objects with precision
  - ⏱️ **UI & analytics** – Formatting durations, tracking activity, and displaying time intuitively

`time_plus` closes the gaps in Dart’s native `DateTime` and `Duration` APIs — making your code easier to write, easier to read, and easier to trust.

---

### ➕ `add` — Add Time to a `DateTime`

Extend `DateTime` just like you wish it worked. These extensions let you safely add milliseconds, hours, days, months, and even centuries — with proper handling for leap years and end-of-month overflows.

- `addMilliseconds(int)` / `addMillisecond`
- `addSeconds(int)` / `addSecond`
- `addMinutes(int)` / `addMinute`
- `addHours(int)` / `addHour`
- `addDays(int)` / `addDay`
- `addWeeks(int)` / `addWeek`
- `addMonths(int)` / `addMonth`
- `addYears(int)` / `addYear`
- `addDecades(int)` / `addDecade` (10-year spans)
- `addCenturies(int)` / `addCentury` (100-year spans)

All methods return a new `DateTime` instance. Month and year-based methods clamp invalid dates (e.g. Feb 30 → Feb 28/29), ensuring always-valid results.

#### 🧪 Example

```dart
final now = DateTime(2024, 2, 29);
final nextYear = now.addYear;                 // → 2025-02-28
final chained = now.addYear.addYear.addMonth; // → 2026-03-29
final future = now.addDecades(2);             // → 2044-02-29
final long = now.addCenturies(1);             // → 2124-02-29
```

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### 🧩 `isSame` — Compare Temporal Precision

Quickly compare two `DateTime` instances with precision — from year-level down to microseconds. Each method checks only the relevant granularity, making it ideal for scheduling, display logic, or grouping events.

- `isSameMicrosecond(DateTime)`
- `isSameMillisecond(DateTime)`
- `isSameSecond(DateTime)`
- `isSameMinute(DateTime)`
- `isSameHour(DateTime)`
- `isSameDay(DateTime)`
- `isSameMonth(DateTime)`
- `isSameYear(DateTime)`
- `isSameDecade(DateTime)` (10-year spans)
- `isSameCentury(DateTime)` (100-year spans)

Each method returns `true` if the current `DateTime` matches the given one at that specific resolution.

#### 🧪 Example

```dart
final a = DateTime(2024, 4, 20, 10, 15);
final b = DateTime(2024, 4, 20, 10, 45);

a.isSameDay(b);     // → true
a.isSameHour(b);    // → true
a.isSameMinute(b);  // → false
```

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### 🧱 `startOf` / `endOf` — DateTime Boundaries

Get the exact start or end of any time unit — minute, hour, day, week, month, or year. These helpers return a new `DateTime` aligned to the boundary, ideal for filtering, grouping, or time range logic.

- `startOfMillisecond` / `endOfMillisecond`
- `startOfSecond` / `endOfSecond`
- `startOfMinute` / `endOfMinute`
- `startOfHour` / `endOfHour`
- `startOfDay` / `endOfDay`
- `startOfWeek` / `endOfWeek` (Monday → Sunday)
- `startOfMonth` / `endOfMonth`
- `startOfYear` / `endOfYear`
- `startOfDecade` / `endOfDecade` (10-year spans)
- `startOfCentury` / `endOfCentury` (100-year spans)

Each result is a fresh `DateTime` at the **zero point** of the boundary (or start of the next one, for `endOf...`).

#### 🧪 Example

```dart
final now = DateTime(2024, 4, 20, 15, 45, 12);

now.startOfDay;   // → 2024-04-20 00:00:00
now.endOfDay;     // → 2024-04-21 00:00:00
now.startOfWeek;  // → 2024-04-15 00:00:00 (Monday)
now.endOfMonth;   // → 2024-05-01 00:00:00
```

These methods respect the original timezone (`local` or `UTC`).

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### ⏭️ `next` — Find the Next Matching `DateTime`

Easily find the **next time** that matches a specific weekday or time of day — skipping the current moment even if it matches. Useful for scheduling recurring events, alarms, or reminders.

- `nextWeekdayTime(weekday, ...)`
  → Returns the next occurrence of a specific weekday (1–7, Monday–Sunday), with optional time.
- `nextTimeOfDay(hour, ...)`
  → Returns the next time that matches the given time of day (tomorrow if already passed today).

These respect the original timezone (UTC/local) and guarantee forward-only results.

#### 🧪 Example

```dart
final now = DateTime(2024, 4, 20, 15); // Saturday

now.nextWeekdayTime(1, hour: 9); // → Monday 09:00
now.nextTimeOfDay(hour: 8);      // → Tomorrow 08:00
```

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### 🐸 `leap` — Leap Year, Month, and Day Detection

Easily check if a `DateTime` falls in a leap year, on a leap month (February in a leap year), or on the rarest of all — leap day itself (Feb 29).

- `isLeapYear` — `true` if the year has 366 days
- `isLeapMonth` — `true` if it’s February in a leap year
- `isLeapDay` — `true` if it’s exactly February 29

#### 🧪 Example

```dart
final date = DateTime(2024, 2, 29);
final dateNotDay = DateTime(2024, 2, 28);

date.isLeapYear;      // → true
date.isLeapMonth;     // → true
date.isLeapDay;       // → true
dateNotDay.isLeapDay; // → false
```

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### 📅 `yesterday` / `tomorrow` — Relative Day Helpers

Convenient shortcuts to get `yesterday`, `tomorrow`, and their weekday numbers — always aligned to the start of the day.

- `yesterday` — Start of the previous day
- `tomorrow` — Start of the next day
- `previousWeekday` — Weekday number of yesterday (`1 = Monday`, `7 = Sunday`)
- `nextWeekday` — Weekday number of tomorrow

Perfect for logic around schedules, shifts, events, or time-based UI highlights.

#### 🧪 Example

```dart
final now = DateTime(2024, 4, 20, 13, 45); // Saturday

now.yesterday;         // → 2024-04-19 00:00:00
now.tomorrow;          // → 2024-04-21 00:00:00
now.previousWeekday;   // → 5 (Friday)
now.nextWeekday;       // → 7 (Sunday)
```

All results respect the original time zone (`local` or `UTC`).

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### ➕ `add` — Add Time Units to a Duration

Easily extend a `Duration` by any time unit — from microseconds to centuries — using intuitive, chainable methods. Supports both numeric arguments and single-unit getters for clear, readable code.

- `addMicroseconds(int)` / `addMicrosecond`
- `addMilliseconds(int)` / `addMillisecond`
- `addSeconds(int)` / `addSecond`
- `addMinutes(int)` / `addMinute`
- `addHours(int)` / `addHour`
- `addDays(int)` / `addDay`
- `addWeeks(int)` / `addWeek` (7-day spans)
- `addMonths(int)` / `addMonth` (Approximation of 30-day months)
- `addYears(int)` / `addYear` (Approximation of 365-day years)
- `addDecades(int)` / `addDecade` (3650-day spans)
- `addCenturies(int)` / `addCentury` (36500-day spans)

All methods return a new `Duration` without modifying the original instance.

#### 🧪 Example

```dart
final duration = Duration(hours: 1);
final extended = duration.addMinutes(30);     // → 1h 30m
final chained = duration.addDay.addHour;      // → 1d 2h
final future = duration.addDecades(1);        // → 3650d + 1h
```

> ⚠️ **Note on accuracy:**  
> The `addMonths`, `addYears`, `addDecades`, and `addCenturies` methods on `Duration` use **fixed approximations**  
> (30 days per month, 365 days per year, etc.). These are suitable for rough estimates, timers, or analytics —  
> but not for **calendar-accurate** date math.
>
> ✅ For precise handling of leap years, month lengths, and date rollovers, use the equivalent methods on `DateTime` instead.

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### 🧮 `in` — Convert Duration to Whole Units

Convert a `Duration` into whole, integer-based time units — perfect for calculations, comparisons, or formatting where only full units matter. These getters are safe, clear, and consistent with calendar approximations.

- `inWeeks` — Full 7-day weeks
- `inMonths` — Full 30-day months
- `inYears` — Full 365-day years
- `inDecades` — Full 10-year spans
- `inCenturies` — Full 100-year spans

All values are calculated using integer division and return only whole units.

```dart
final d = Duration(days: 750);
d.inYears;      // → 2
d.inMonths;     // → 25
```

> ⚠️ **Note on accuracy:**  
> The `addMonths`, `addYears`, `addDecades`, and `addCenturies` methods on `Duration` use **fixed approximations**  
> (30 days per month, 365 days per year, etc.). These are suitable for rough estimates, timers, or analytics —  
> but not for **calendar-accurate** date math.
>
> ✅ For precise handling of leap years, month lengths, and date rollovers, use the equivalent methods on `DateTime` instead.

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### 🧩 `only` — Break Down Duration by Remaining Units

Decompose a `Duration` into its leftover parts, excluding higher units. Ideal for time formatting (e.g. `1h 23m 45s`) or visual breakdowns.

- `onlyMicroseconds` — Microseconds (excluding full milliseconds)
- `onlyMilliseconds` — Milliseconds (excluding full seconds)
- `onlySeconds` — Seconds (excluding full minutes)
- `onlyMinutes` — Minutes (excluding full hours)
- `onlyHours` — Hours (excluding full days)
- `onlyDays` — Total full days

These getters let you reconstruct any `Duration` piece by piece.

```dart
final duration = Duration(days: 1, hours: 2, minutes: 45, seconds: 30);

final days = duration.onlyDays;
final hours = duration.onlyHours;
final minutes = duration.onlyMinutes;
final seconds = duration.onlySeconds;

print('$days days, $hours hours, $minutes minutes, $seconds seconds');
// → 1 days, 2 hours, 45 minutes, 30 seconds
```

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### 🧼 `without` — Remove Full Units from a Duration

Strip away full units from a `Duration`, leaving only the remainder. Useful when you want the leftover time **within** a day, hour, minute, or second — like isolating time of day or breaking durations into parts.

- `withoutDays` — Removes full days, keeps hours/minutes/etc.
- `withoutHours` — Removes full hours, keeps minutes/seconds/etc.
- `withoutMinutes` — Removes full minutes, keeps seconds/milliseconds/etc.
- `withoutSeconds` — Removes full seconds, keeps milliseconds/microseconds
- `withoutMilliseconds` — Removes full milliseconds, keeps microseconds

Each method returns a new `Duration` with the higher units removed.

#### 🧪 Example

```dart
final d = Duration(hours: 2, minutes: 45, seconds: 30);
final remainder = d.withoutHours; // → 0:45:30.000000
```

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### 🏗️ `factories` — Create Durations from Any Unit

A unified way to construct `Duration` instances from any time unit — including long spans like months, years, decades, and centuries. Provides both numeric constructors and ready-to-use constants.

- `microseconds(int)`, `milliseconds(int)`, `seconds(int)`
- `minutes(int)`, `hours(int)`, `days(int)`
- `weeks(int)`, `months(int)`, `years(int)`
- `decades(int)`, `centuries(int)`
- Predefined constants:
  `microsecond`, `millisecond`, `second`, `minute`, `hour`, `day`,
  `week`, `month`, `year`, `decade`, `century`

These are calendar-aligned approximations:

- 1 week = 7 days
- 1 month = 30 days
- 1 year = 365 days
- 1 decade = 3650 days
- 1 century = 36500 days

#### 🧪 Example

```dart
final workout = DurationFrom.minutes(45);
final breakTime = DurationFrom.week; // constant: 7 days
final future = workout + DurationFrom.years(2);
```

> ⚠️ **Note on accuracy:**  
> The `addMonths`, `addYears`, `addDecades`, and `addCenturies` methods on `Duration` use **fixed approximations**  
> (30 days per month, 365 days per year, etc.). These are suitable for rough estimates, timers, or analytics —  
> but not for **calendar-accurate** date math.
>
> ✅ For precise handling of leap years, month lengths, and date rollovers, use the equivalent methods on `DateTime` instead.

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

## 🔗 License MIT © Jozz

<p align="center">
  <a href="https://buymeacoffee.com/yosefd99v" target="https://buymeacoffee.com/yosefd99v">
    ☕ Enjoying this package? You can support it here.
  </a>
</p>
