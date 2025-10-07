extension DateTimeExtensions on DateTime {
  /// Returns true if the date is today
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// Returns true if the date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// Returns true if the date is tomorrow
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// Returns true if the date is in the past
  bool get isPast => isBefore(DateTime.now());

  /// Returns true if the date is in the future
  bool get isFuture => isAfter(DateTime.now());

  /// Returns difference in days (absolute value)
  int daysBetween(DateTime other) => (difference(other).inDays).abs();

  /// Returns difference in hours (absolute value)
  int hoursBetween(DateTime other) => (difference(other).inHours).abs();

  /// Returns difference in minutes (absolute value)
  int minutesBetween(DateTime other) => (difference(other).inMinutes).abs();

  /// Adds days and returns new DateTime
  DateTime addDays(int days) => add(Duration(days: days));

  /// Subtracts days and returns new DateTime
  DateTime subtractDays(int days) => subtract(Duration(days: days));

  /// Adds hours and returns new DateTime
  DateTime addHours(int hours) => add(Duration(hours: hours));

  /// Subtracts hours and returns new DateTime
  DateTime subtractHours(int hours) => subtract(Duration(hours: hours));

  /// Format to readable string like “2 hours ago”
  String get timeAgo {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes} min ago';
    if (diff.inHours < 24) {
      return '${diff.inHours} hour${diff.inHours > 1 ? 's' : ''} ago';
    }

    if (diff.inDays < 7) {
      return '${diff.inDays} day${diff.inDays > 1 ? 's' : ''} ago';
    }

    if (diff.inDays < 30) {
      return '${(diff.inDays / 7).floor()} week${diff.inDays >= 14 ? 's' : ''} ago';
    }

    if (diff.inDays < 365) {
      return '${(diff.inDays / 30).floor()} month${diff.inDays >= 60 ? 's' : ''} ago';
    }

    return '${(diff.inDays / 365).floor()} year${diff.inDays >= 730 ? 's' : ''} ago';
  }

  ///  Returns the first day of the month
  DateTime get firstDayOfMonth => DateTime(year, month, 1);

  ///  Returns the last day of the month
  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);
}
