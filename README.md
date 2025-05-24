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
- [**subtract**](#-subtract--subtract-time-from-a-datetime) – Subtract time units from `DateTime` using intuitive, calendar-aware methods.
- [**isSame**](#-issame--compare-temporal-precision) – Compare two dates by year, month, day, hour, to microseconds using `isSameX()`.
- [**startOf / endOf**](#-startof--endof--datetime-boundaries) – Get start or end of time units: minute, hour, day, week, month, year.
- [**next**](#️-next--find-the-next-matching-datetime) – Find the next matching `DateTime` by weekday or time of day.
- [**leap**](#-leap--leap-year-month-and-day-detection) – Check if `DateTime` is in a leap year, leap month, or on leap day (Feb 29).
- [**daysInMonth / daysInYear**](#-daysinmonth--daysinyear--calendar-aware-date-info) – Get days in current month/year, with leap year handling.
- [**yesterday / tomorrow**](#-yesterday--tomorrow--relative-day-helpers) – Get yesterday or tomorrow with `.yesterday` or `.tomorrow` getters.

#### ⏱️ `Duration`

- [**add**](#-add--add-time-units-to-a-duration) – Chain any time unit, from microseconds to centuries, with `.addX()` or `.addX` getters.
- [**in**](#-in--convert-duration-to-whole-units) – Convert durations into whole units like `inWeeks`, `inYears`, or `inCenturies`.
- [**as**](#-as--convert-duration-to-fractional-units) – Convert durations to fractional units like `asDays`, `asWeeks`, or `asCenturies`.
- [**only**](#-only--break-down-duration-by-remaining-units) – Extract the remainder after subtracting larger units (e.g. `onlyMinutes`, `onlySeconds`).
- [**without**](#-without--remove-full-units-from-a-duration) – Strip full units to isolate what's left (e.g. time since midnight).
- [**int** -> `Duration`](#-int--duration--natural-time-expressions) – Create Duration using `int` with `1.days`, `2.hours`, `3.minutes`, etc.
- [**double** -> `Duration`](#-double--duration--fractional-time-made-precise) – `1.5.hours`, `2.25.minutes`, `0.5.days`, etc. (with precise decomposition)
- [**Factories**](#️-factories--create-durations-from-any-unit) – Create durations from any unit or use built-in constants like `DurationFrom.year`.

## Why Use `time_plus`?

✅ **Zero dependencies** – Pure Dart. No setup or third-party overhead.  
✅ **Lightweight & fast** – Minimal footprint with efficient, production-safe code.  
✅ **Comprehensive time tools** – Add, compare, normalize, and decompose dates and durations with ease.  
✅ **Reliable and robust** – Built for real-world use, with **128 extensions** and **717 tests** ensuring stability.
✅ **A better alternative to the `time` package** – Passes tests the `time` package fails, performs faster, and avoids questionable design choices like hard dependencies on `clock` and more, does not have "clock" features (keeps separation of concerns).

- **Ideal for:**
  - 🗓 **Calendar logic** – Scheduling, planning, date math, and recurring events
  - 🧮 **Data handling** – Grouping, filtering, and comparing `DateTime` objects with precision
  - ⏱️ **UI & analytics** – Formatting durations, tracking activity, and displaying time intuitively

`time_plus` closes the gaps in Dart's native `DateTime` and `Duration` APIs — making your code easier to write, easier to read, and easier to trust.

- **[In depth **`time` vs `time_plus`** comparison](#time-vs-time_plus)**
- **[Why not just improve `time`?](#why-not-just-improve-time)**

---

### ➕ `add` — Add Time to a `DateTime`

Extend `DateTime` just like you wish it worked. These extensions let you safely add milliseconds, hours, days, months, and even centuries — with proper handling for leap years and end-of-month overflows.

- `addMilliseconds(int)` / `addMillisecond`
- `addSeconds(int)` / `addSecond`
- `addMinutes(int)` / `addMinute`
- `addHours(int)` / `addHour`
- `addDays(int)` / `addDay` — Preserves exact time of day (all following methods do)
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

> **Important:** The `addDays` and `addWeeks` and the bigger time units methods preserve the exact time of day and are calendar-aware, making them safe for daylight saving time transitions. They are not equivalent to adding hours.

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### ➖ `subtract` — Subtract Time from a `DateTime`

Safely subtract time from any `DateTime` using intuitive, calendar-aware methods. These extensions go beyond raw durations to handle months, years, decades, and centuries — correctly accounting for leap years, daylight saving, and invalid dates like Feb 30.

- `subtractMilliseconds(int)` / `subtractMillisecond`
- `subtractSeconds(int)` / `subtractSecond`
- `subtractMinutes(int)` / `subtractMinute`
- `subtractHours(int)` / `subtractHour`
- `subtractDays(int)` / `subtractDay` — Preserves exact time of day (all following methods do)
- `subtractWeeks(int)` / `subtractWeek`
- `subtractMonths(int)` / `subtractMonth`
- `subtractYears(int)` / `subtractYear`
- `subtractDecades(int)` / `subtractDecade` (10-year spans)
- `subtractCenturies(int)` / `subtractCentury` (100-year spans)

All methods return a new `DateTime` instance. Month and year-based methods clamp invalid dates (e.g. March 31 → February 28/29), ensuring always-valid results.

#### 🧪 Example

```dart
final now = DateTime(2024, 2, 29);
final lastYear = now.subtractYear;                 // → 2023-02-28
final chained = now.subtractYear.subtractMonth;    // → 2022-01-28
final past = now.subtractDecades(2);               // → 2004-02-29
final wayBack = now.subtractCenturies(1);          // → 1924-02-29
```

> **Important:** The `subtractDays` and `subtractWeeks` and the bigger time units methods preserve the exact time of day and are calendar-aware, making them safe for daylight saving time transitions. They are not equivalent to subtracting hours.

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
- `isLeapMonth` — `true` if it's February in a leap year
- `isLeapDay` — `true` if it's exactly February 29

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

### 📅 `daysInMonth` / `daysInYear` — Calendar-Aware Date Info

Get the correct number of days in the current month or year, with full leap year handling built in. Ideal for calendar UIs, range generators, or custom date calculations.

- `daysInMonth` — Returns 28–31 based on month and leap year
- `daysInYear` — Returns 365 or 366 based on the current year

#### 🧪 Example

```dart
DateTime(2024, 2, 10).daysInMonth; // → 29 (leap year)
DateTime(2023, 2, 10).daysInMonth; // → 28
DateTime(2024, 1, 1).daysInYear;   // → 366
DateTime(2023, 1, 1).daysInYear;   // → 365
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
- `addMonths(int)` / `addMonth` (≈30.436875 days)
- `addYears(int)` / `addYear` (≈365.2425 days)
- `addDecades(int)` / `addDecade` (≈3652.425 days)
- `addCenturies(int)` / `addCentury` (≈36,524.25 days)

All methods return a new `Duration` without modifying the original instance.

#### 🧪 Example

```dart
final duration = Duration(hours: 1);
final extended = duration.addMinutes(30);     // → 1h 30m
final chained = duration.addDay.addHour;      // → 1d 2h
final future = duration.addDecades(1);        // → ~3652.4d + 1h
```

> ⚠️ **Note on accuracy:**
> The `addMonths`, `addYears`, `addDecades`, and `addCenturies` methods on `Duration` now use **long-term Gregorian averages**
> (e.g., 30.436875 days/month, 365.2425 days/year) based on a 400-year cycle.
> These are more precise than previous fixed approximations, but still not suitable for exact date calculations.
>
> ✅ For calendar-accurate operations (e.g., leap years, end-of-month logic), use the equivalent methods on `DateTime` instead.

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### 🧮 `in` — Convert Duration to Whole Units

Convert a `Duration` into whole, integer-based time units — perfect for calculations, comparisons, or formatting where only full units matter. These getters are safe, clear, and based on **long-term Gregorian averages**.

- `inWeeks` — Full 7-day weeks
- `inMonths` — Full months (≈30.436875 days)
- `inYears` — Full years (≈365.2425 days)
- `inDecades` — Full decades (≈3652.425 days)
- `inCenturies` — Full centuries (≈36,524.25 days)

All values are calculated using **integer division** and return only **whole units**.

```dart
final d = Duration(days: 750);
d.inYears;      // → 2
d.inMonths;     // → 24
```

> ⚠️ **Note on precision:**
> These unit conversions are based on **mean durations** over 400 years in the Gregorian calendar.
> While significantly more accurate than fixed approximations (like "30 days per month"), they still **do not match exact calendar units**.
>
> ✅ Use `DateTime` methods for exact date math, including leap years and end-of-month boundaries.

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### ➗ `as` — Convert Duration to Fractional Units

Convert a `Duration` to floating-point values — including fractions — in any time unit, from milliseconds to centuries. Unlike `inX`, which gives only whole units, `asX` provides precise decimal results.

- `asMilliseconds`, `asSeconds`, `asMinutes`, `asHours`, `asDays`
- `asWeeks`, `asMonths`, `asYears`, `asDecades`, `asCenturies`

All values are `double` and include partial units (e.g., `1.5 days`, `2.75 hours`).

### 🧪 Example

```dart
final duration = Duration(hours: 36);

duration.asDays;     // → 1.5
duration.asWeeks;    // → ~0.214
duration.asYears;    // → ~0.0041
```

> ⚠️ **Note on precision:**
> The months/years/decades/centuries conversions are based on **mean durations** over 400 years in the Gregorian calendar.
> While significantly more accurate than fixed approximations (like "30 days per month"), they still **do not match exact calendar units**.
>
> ✅ Use `DateTime` methods for exact date math, including leap years and end-of-month boundaries.

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

### 🔢 `int` → `Duration` — Natural Time Expressions

Make your time math more expressive. These extensions let you turn any `int` into a `Duration` — from milliseconds to centuries — using natural, readable syntax.

- `1.milliseconds`, `1.seconds`, `1.minutes`, `1.hours`, `1.days`
- `2.weeks`, `3.months`, `5.years`, `10.decades`, `1.centuries`

This makes time-based calculations cleaner and easier to read — no more `Duration(seconds: 5)` boilerplate.

#### 🧪 Example

```dart
final delay = 3.seconds + 500.milliseconds;
final timeout = 2.hours + 30.minutes;
final historical = 2.centuries - 1.decade;
final oneYear = 1.days + 2.hours + 30.minutes + 15.seconds;
```

> ⚠️ **Note on accuracy:**
> The months/years/decades/centuries are based on **long-term Gregorian averages** derived from a 400-year calendar cycle.
> They are excellent for simulations, scheduling, and time estimation —
> but do not reflect the exact number of days in individual months or years.
>
> ✅ For exact date handling (leap years, month lengths, DST shifts), use `DateTime` instead.

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### 🔬 `double` → `Duration` — Fractional Time Made Precise

Convert decimal values into smart, decomposed `Duration` objects. Supports precise handling of fractions — like 1.5 hours or 2.75 months — with full breakdown into microseconds.

- `1.5.seconds`, `2.25.minutes`, `0.5.hours`
- `1.5.days`, `2.75.weeks`, `0.33.months`
- `0.1.years`, `1.25.decades`, `2.5.centuries`

Internally decomposed into full `Duration` fields: days, hours, minutes, etc., for consistent and readable output — even across large or fractional units.

#### 🧪 Example

```dart
final nap = 1.5.hours;              // → 1h 30m 0s
final quarter = 0.25.years;         // → ~91 days
final longView = 2.5.centuries;     // → 91250 days
```

> ⚠️ **Note on accuracy:**
> The months/years/decades/centuries are based on **long-term Gregorian averages** derived from a 400-year calendar cycle.
> They are excellent for simulations, scheduling, and time estimation —
> but do not reflect the exact number of days in individual months or years.
>
> ✅ For exact date handling (leap years, month lengths, DST shifts), use `DateTime` instead.

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

### 🏗️ `factories` — Create Durations from Any Unit

This is the **core of all `Duration` creation in the package** — powering everything from `int` and `double` extensions to `add` methods and smart conversions.

A unified way to construct `Duration` instances from any time unit — including long spans like months, years, decades, and centuries. Provides both numeric constructors and ready-to-use constants.

- `microseconds(int)`, `milliseconds(int)`, `seconds(int)`
- `minutes(int)`, `hours(int)`, `days(int)`
- `weeks(int)`, `months(int)`, `years(int)`
- `decades(int)`, `centuries(int)`
- Predefined constants:
  `microsecond`, `millisecond`, `second`, `minute`, `hour`, `day`,
  `week`, `month`, `year`, `decade`, `century`

These follow **long-term Gregorian calendar averages**:

- 1 week = 7 days
- 1 month ≈ 30.436875 days
- 1 year ≈ 365.2425 days
- 1 decade ≈ 3,652.425 days
- 1 century ≈ 36,524.25 days

#### 🧪 Example

```dart
final workout = DurationFrom.minutes(45);
final breakTime = DurationFrom.week; // constant: 7 days
final future = workout + DurationFrom.years(2); // ≈ 730.485 days
```

> ⚠️ **Note on accuracy:**
> All factory methods use **averaged Gregorian values** derived from a 400-year calendar cycle.
> These are excellent for simulations, scheduling, and time estimation —
> but do not reflect the exact number of days in individual months or years.
>
> ✅ For exact date handling (leap years, month lengths, DST shifts), use `DateTime` instead.

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

## `time` vs `time_plus`

The Dart [`time`](https://pub.dev/packages/time) package provides a handful of `DateTime` and `Duration` extensions, but it's tightly coupled to the `clock` package and lacks precision, modularity, and extensibility.

By contrast, **`time_plus`** was built from real-world project needs. It keeps clock logic out of core date/time operations, performs better, passes more edge-case tests, and offers **8x more functionality** with no extra dependencies.

**In short:**
`time_plus` is a **modern, accurate, and robust** alternative — not a fork, but a clean rethinking of what Dart’s time handling _should_ be.

| Feature/Aspect             | `time`                                                                 | `time_plus`                                               |
| -------------------------- | ---------------------------------------------------------------------- | --------------------------------------------------------- |
| **Dependencies**           | ❌ Requires `clock` package — introduces tight coupling                | ✅ Zero dependencies — modular and self-contained         |
| **Separation of Concerns** | ❌ Blends clock management with date/time logic                        | ✅ Clean boundaries — clock logic handled externally      |
| **Extension Coverage**     | ❌ \~15 basic extensions                                               | ✅ 128 extensions — composable, precise, and field-tested |
| **DateTime Utilities**     | ❌ Limited API: `isSameXAs`, `copyWith`, `shift`                       | ✅ Extensive support: unit math, boundaries, recurrence   |
| **Duration Utilities**     | ❌ Only provides unit constructors (`2.hours`), with known test issues | ✅ Full suite: `in`, `as`, `only`, `without`, factories   |
| **Precision & Accuracy**   | ❌ Integer-based math; known inconsistencies in edge cases             | ✅ High-precision constants; 717 verified unit tests      |

_[⤴️ Back](#table-of-contents) -> Table of Contents_

## Why Not Just Improve `time`?

The [`time`](https://pub.dev/packages/time) package provides a minimal set of extensions on `Duration` and `DateTime`, but it falls short of the flexibility, performance, and precision needed for real-world applications. Rather than attempting to patch a narrowly scoped and structurally limited library, we built `time_plus` from the ground up with clear priorities: accuracy, extensibility, modularity, and production safety.

---

### A Different Goal

`time_plus` didn’t begin as a replacement for `time`. It started with a completely separate purpose — to add _modular, testable, and precise_ extensions to `Duration` and `DateTime`, with a clear boundary between calendar logic and runtime clocks.

Later, once the package matured and handled large-scale duration and date logic cleanly, it expanded to support `int`/`double` extensions as well — but with strict attention to **precision**, **performance**, and **decomposition logic**.

In contrast, `time` was always focused on quick syntax enhancements, like:

```dart
final future = 10.minutes.fromNow;
final delay = 2.5.hours.delay;
```

Which are helpful — but shallow in scope and tied to global clock behavior.

---

### **Limited Scope, By Design**

- `time_plus` introduces over **120 extensions**, covering:

  - full time arithmetic across centuries
  - granular comparisons (e.g., `isSameMinute`, `isSameDay`)
  - `startOf`, `endOf`, `next`, `yesterday`, `tomorrow`
  - complete `Duration` breakdowns (`only`, `without`)
  - support for `int` and `double` → `Duration`, factories, and more.

---

### Smarter Memory Usage

In `time`, common getters like `daysInMonth` create a new list **every time** they are called — even though the values are static and immutable. This results in unnecessary allocations that can impact both performance and garbage collection in high-frequency code paths.

```dart
// time (creates a new list on every access)
final days = [
  31, // January
  if (isLeapYear) 29 else 28,
  ...
];
```

In contrast, `time_plus` uses **compile-time constant lists**:

```dart
// time_plus (zero allocation)
const commonYearDays = [...];
const leapYearDays = [...];
```

This approach is not only more efficient — especially in tight loops or calendar-heavy logic — but also avoids subtle bugs from mutable runtime-created data. It’s a small optimization with **real-world impact** at scale.

Additionally, `time_plus` applies the same zero-allocation mindset across `Duration` math, leap year checks, and unit decompositions — ensuring every operation remains performant, consistent, and GC-friendly.

---

### Clock Coupling in `time`

A core architectural limitation of the `time` package is its **implicit dependency on the `clock` package**, which introduces hidden state into APIs that should remain deterministic and side-effect-free.

#### Implicit State in Common Operations

The `time` package injects runtime logic directly into extension getters such as:

```dart
final future = 5.minutes.fromNow;
final past = 2.hours.ago;
final isToday = someDate.isToday;
```

Although these appear to be lightweight utilities, they internally call `clock.now()`, meaning:

- The result is **time-sensitive and non-deterministic**
- Behavior depends on a **global singleton**
- Testing becomes brittle without additional mocking infrastructure

This design choice tightly couples business logic with environmental state, reducing testability, predictability, and modularity — especially in larger codebases.

---

### Precision Matters

One of the most critical shortcomings in the `time` package is its reliance on simple multiplication when converting numbers into `Duration` objects:

```dart
Duration get days => milliseconds * Duration.millisecondsPerDay;
```

This approach treats `2.5.days` the same as `2.5 * 86_400_000`, which leads to **accumulated rounding errors** and **loss of microsecond-level precision**. Worse, this same calculation is applied identically to both `int` and `double` types — even though they should be handled differently.

#### In contrast, `time_plus`:

- Uses the native `Duration` constructor for all `int`-based units (e.g. `3.days` → `Duration(days: 3)`), avoiding unnecessary conversions.
- For fractional values (`double`), it performs **smart decomposition**:

  - Breaks `2.5.days` into `Duration(days: 2, hours: 12)`
  - Maintains sub-millisecond precision by working directly with microseconds

- Applies this decomposition for all scales — from microseconds to centuries — preserving accuracy and performance across the board.

The result is predictable, consistent, and verifiable time math — even in complex or high-frequency environments. With `time_plus`, you're not just getting shorthand syntax — you're getting a precision-engineered time system built for production.

---

### Leap Year Logic

In production code, we favor **mathematical consistency** unless business logic explicitly dictates otherwise. The `time` package's implementation of `isLeapYear` includes a hardcoded domain check — restricting results to `year >= 1582`.

```dart
// From `time`
bool get isLeapYear =>
  year >= 1582 && year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
```

This artificial constraint introduces ambiguity and silently fails for valid dates before the Gregorian reform — which may be entirely acceptable in many systems (e.g. calendar tools, academic or historical models).

By contrast, `time_plus` implements **pure Gregorian leap year logic**, applicable to any `DateTime` instance, and extends functionality with precise checks for `isLeapMonth` and `isLeapDay`.

```dart
// From `time_plus`
bool get isLeapYear =>
  year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
```

This makes the behavior deterministic, testable, and consistent — critical traits in time logic. No hidden assumptions. No unnecessary domain rules. Just predictable, correct results.

Additionally, `time_plus` introduces:

- `isLeapMonth` – true only for February in leap years
- `isLeapDay` – true only for February 29th in leap years

This level of expressiveness is missing entirely in `time`, making `time_plus` a more complete and accurate solution for calendar-based logic.
Certainly. Here's a concise, professional explanation you can include in your README or documentation:

> **In Dart, all `DateTime` values follow the proleptic Gregorian calendar**, meaning the Gregorian leap year rules are applied consistently across all years, even those before 1582.

This ensures predictable and mathematically correct behavior, regardless of historical transitions. Most applications don’t model historical calendars — they just need consistent and reliable time math.

By avoiding arbitrary cutoffs like `year >= 1582`, `time_plus` aligns with Dart’s native behavior and supports a broader range of valid use cases without introducing unnecessary constraints.

---

### **Test Failures and Fragile Behavior**

Many of `time`’s numeric and duration operations **fail precision-based tests**, particularly for fractional durations and boundary cases. Its logic isn’t designed for edge-case correctness or production-scale stability.

`time_plus` is built with:

- **717 tests** covering edge cases, conversions, rounding, and regressions.
- Extensive real-world validation in multiple production apps.
- Clean architecture that ensures correctness by design.

_[⤴️ Back](#table-of-contents) -> Table of Contents_

---

## 🔗 License MIT © Jozz

<p align="center">
  <a href="https://buymeacoffee.com/yosefd99v" target="https://buymeacoffee.com/yosefd99v">
    ☕ Enjoying this package? You can support it here.
  </a>
</p>
