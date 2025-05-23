extension DateTimeUtcFlagExtensions on DateTime {
  /// Creates a [DateTime] object with the same UTC flag as the original.
  ///
  /// Constructs a new [DateTime] object using the provided [year], [month], [day], [hour], [minute],
  /// [second], [millisecond], and [microsecond] parameters. The new [DateTime] will have the same
  /// UTC flag as the original: if the original [DateTime] is in UTC, the new [DateTime] will also be in UTC.
  DateTime withSameUtcFlag(int year,
      [int month = 1,
      int day = 1,
      int hour = 0,
      int minute = 0,
      int second = 0,
      int millisecond = 0,
      int microsecond = 0]) {
    return isUtc
        ? DateTime.utc(
            year, month, day, hour, minute, second, millisecond, microsecond)
        : DateTime(
            year, month, day, hour, minute, second, millisecond, microsecond);
  }

  /// Creates a new [DateTime] object with the same UTC flag as the original.
  ///
  /// Constructs a new [DateTime] object using the provided parameters, defaulting to the values
  /// of the original [DateTime] if not specified. The new [DateTime] will have the same UTC flag
  /// as the original: if the original [DateTime] is in UTC, the new [DateTime] will also be in UTC.
  DateTime copyWithSameUtcFlag({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return withSameUtcFlag(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}
