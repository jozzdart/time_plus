import '../../consts.dart';
import 'month_and_year.dart';

/// Extension on [DateTime] to add decades and centuries, with proper handling of year overflow.
extension DateTimeAddExtendingYearsExtension on DateTime {
  /// Returns a new [DateTime] with the specified number of [decades] added.
  ///
  /// This method calculates the total number of years by multiplying the
  /// given decades by the number of years in a decade, which is 10. It then adds these years to the current
  /// [DateTime] instance.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2024, 5, 20);
  /// DateTime future = now.addDecades(3); // May 20, 2054
  /// ```
  DateTime addDecades(int decades) {
    return addYears(decades * TimePlusConsts.yearsInDecade);
  }

  /// Returns a new [DateTime] with the specified number of [centuries] added.
  ///
  /// This method calculates the total number of decades by multiplying the
  /// given centuries by the number of decades in a century, which is 10. It then adds these decades to the
  /// current [DateTime] instance.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2024, 5, 20);
  /// DateTime future = now.addCenturies(1); // May 20, 2124
  /// ```
  DateTime addCenturies(int centuries) {
    return addDecades(centuries * TimePlusConsts.decadesInCentury);
  }

  /// Shortcut to add exactly one decade to the current [DateTime].
  ///
  /// This getter is a convenient way to add a single decade without
  /// specifying the number of decades explicitly.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2024, 5, 20);
  /// DateTime future = now.addDecade; // May 20, 2034
  /// ```
  DateTime get addDecade => addDecades(1);

  /// Shortcut to add exactly one century to the current [DateTime].
  ///
  /// This getter is a convenient way to add a single century without
  /// specifying the number of centuries explicitly.
  ///
  /// Example:
  /// ```dart
  /// DateTime now = DateTime(2024, 5, 20);
  /// DateTime future = now.addCentury; // May 20, 2124
  /// ```
  DateTime get addCentury => addCenturies(1);
}
