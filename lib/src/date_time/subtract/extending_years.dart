import '../../consts.dart';
import 'month_and_year.dart';

/// Extension on [DateTime] to subtract decades and centuries, with proper handling of year overflow.
extension DateTimeSubtractExtendingYearsExtension on DateTime {
  /// Returns a new [DateTime] with the specified number of [decades] subtracted.
  ///
  /// This method calculates the total number of years by multiplying the
  /// given decades by the number of years in a decade, which is 10. It then subtracts these years from the current
  /// [DateTime] instance.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2024, 5, 20);
  /// DateTime past = now.subtractDecades(3); // May 20, 1994
  /// ```
  DateTime subtractDecades(int decades) {
    return subtractYears(decades * TimePlusConsts.yearsInDecade);
  }

  /// Returns a new [DateTime] with the specified number of [centuries] subtracted.
  ///
  /// This method calculates the total number of decades by multiplying the
  /// given centuries by the number of decades in a century, which is 10. It then subtracts these decades from the
  /// current [DateTime] instance.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2024, 5, 20);
  /// DateTime past = now.subtractCenturies(1); // May 20, 1924
  /// ```
  DateTime subtractCenturies(int centuries) {
    return subtractDecades(centuries * TimePlusConsts.decadesInCentury);
  }

  /// Shortcut to subtract exactly one decade from the current [DateTime].
  ///
  /// This getter is a convenient way to subtract a single decade without
  /// specifying the number of decades explicitly.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2024, 5, 20);
  /// DateTime past = now.subtractDecade; // May 20, 2014
  /// ```
  DateTime get subtractDecade => subtractDecades(1);

  /// Shortcut to subtract exactly one century from the current [DateTime].
  ///
  /// This getter is a convenient way to subtract a single century without
  /// specifying the number of centuries explicitly.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2024, 5, 20);
  /// DateTime past = now.subtractCentury; // May 20, 1924
  /// ```
  DateTime get subtractCentury => subtractCenturies(1);
}
