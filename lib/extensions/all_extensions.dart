import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';

///========================================Context Extensions========================================
extension BuildContextExtensions on BuildContext {
  //=====================Named Routes=====================
  /// Navigate to a named route
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  /// Navigate to a named route and replace the current route
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  /// Navigate to a named route and remove all previous routes
  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  //=====================Normar Routes=====================
  /// Push a new route
  Future<T?> push<T>(Widget page) {
    return Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));
  }

  /// Push a new route and remove all previous routes
  Future<T?> pushAndRemoveAll<T>(Widget page) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  /// Push replacement (replace current page)
  Future<T?> pushReplacement<T>(Widget page) {
    return Navigator.of(
      this,
    ).pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  /// Pop current route (close screen)
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);

  /// Pop until the first route
  void popToFirst() => Navigator.of(this).popUntil((route) => route.isFirst);

  /// Pop until a specific route name
  void popUntil(String routeName) =>
      Navigator.of(this).popUntil(ModalRoute.withName(routeName));

  /// Check if can pop
  bool get canPop => Navigator.of(this).canPop();

  // ========== Theme Access (Cached by Flutter) ==========
  ThemeData get theme => Theme.of(this);

  /// Access text theme
  TextTheme get textTheme => theme.textTheme;

  /// Access color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Check if dark mode is enabled
  bool get isDarkMode => theme.brightness == Brightness.dark;

  // ========== Media Query (Use Sparingly - Can Trigger Rebuilds) ==========

  /// get Screen Size
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Get screen width
  double get width => screenSize.width;

  /// Get screen height
  double get height => screenSize.height;

  /// Get status bar height
  double get statusBarHeight => MediaQuery.paddingOf(this).top;

  /// Get keyboard height
  double get keyboardHeight => MediaQuery.viewInsetsOf(this).bottom;

  /// Check if keyboard is visible
  bool get isKeyboardVisible => keyboardHeight > 0;

  // ========== Responsive Breakpoints ==========

  /// Check if mobile (width < 600) (hint can you modify this)
  bool get isMobile => width < 600;

  /// Check if tablet (600 <= width < 900)
  bool get isTablet => width >= 600 && width < 900;

  /// Check if desktop (width >= 900)
  bool get isDesktop => width >= 900;

  /// get orientation
  Orientation get orientation => MediaQuery.orientationOf(this);

  /// Check if portrait orientation
  bool get isPortrait => orientation == Orientation.portrait;

  /// Check if landscape orientation
  bool get isLandscape => orientation == Orientation.landscape;

  // ========== Responsive Values ==========

  /// Get responsive value based on screen width
  /// (used it for responsive values like margin and padding not for build widget ❌❌ custmizate it by layout builder and pass widget as WidgetBuilder)
  T responsive<T>({required T mobile, T? tablet, T? desktop}) {
    if (isDesktop && desktop != null) return desktop;
    if (isTablet && tablet != null) return tablet;
    return mobile;
  }

  // ========== Focus Management ==========
  /// Unfocus keyboard
  void unfocus() => FocusScope.of(this).unfocus();

  /// Request focus
  void requestFocus(FocusNode node) => FocusScope.of(this).requestFocus(node);

  /// Check if has focus
  bool get hasFocus => FocusScope.of(this).hasFocus;

  // ========== Scaffold Access ==========
  /// Open drawer
  void openDrawer() => Scaffold.of(this).openDrawer();

  /// Open end drawer
  void openEndDrawer() => Scaffold.of(this).openEndDrawer();

  /// Close drawer
  void closeDrawer() => Scaffold.of(this).closeDrawer();

  /// Close end drawer
  void closeEndDrawer() => Scaffold.of(this).closeEndDrawer();

  // ========== Percentage of Screen ==========
  /// Get percentage of screen width
  double widthPercent(double percent) => width * (percent / 100);

  /// Get percentage of screen height
  double heightPercent(double percent) => height * (percent / 100);
}

///==============================Date Time Extensions==============================
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

///==============================String Extensions==============================
// String Extensions
extension StringExtensions on String? {
  /// Check if the string is null or empty
  bool isNullOrEmpty() => this == null || this == "";

  /// Check if the string is null, empty, or contains only whitespace
  bool isNullOrBlank() => this == null || this!.trim().isEmpty;

  /// Capitalize the first letter of a string
  String? capitalize() {
    if (isNullOrEmpty()) return this;
    return '${this![0].toUpperCase()}${this!.substring(1)}';
  }

  /// Remove all whitespace characters (spaces, tabs, newlines)
  String? removeWhitespace() {
    if (isNullOrEmpty()) return this;
    return this!.replaceAll(RegExp(r'\s+'), '');
  }

  /// Remove extra whitespace (trim and replace multiple spaces with single space)
  String? removeExtraSpaces() {
    if (isNullOrEmpty()) return this;
    return this!.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  /// Capitalize the first letter of each word in a string
  String? capitalizeEachWord() {
    if (this == null || this!.isEmpty) return this;
    return this!
        .split(' ')
        .map(
          (word) => word.isNotEmpty
              ? '${word[0].toUpperCase()}${word.substring(1)}'
              : word,
        )
        .join(' ');
  }

  /// Extract numbers from a string
  String? extractNumbers() {
    if (isNullOrEmpty()) return this;
    return this!.replaceAll(RegExp(r'[^0-9]'), '');
  }

  //==================Validation==================//
  bool get isValidEmail {
    if (isNullOrEmpty()) return false;
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this!);
  }

  /// Check if string is a valid phone number (basic validation)
  bool get isValidPhone {
    if (isNullOrEmpty()) return false;
    return RegExp(r'^(010|011|012|015)\d{8}$').hasMatch(this!);
  }

  bool get isValidPassword {
    if (isNullOrEmpty()) return false;
    return RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
    ).hasMatch(this!);
  }

  /// Check if string is a valid URL
  bool get isValidUrl {
    if (isNullOrEmpty()) return false;
    return RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$',
    ).hasMatch(this!);
  }

  /// Check if string contains only numbers
  bool get isNumeric {
    if (isNullOrEmpty()) return false;
    return RegExp(r'^[0-9]+$').hasMatch(this!);
  }

  /// Check if the string is an integer
  bool get isInt {
    if (isNullOrEmpty()) return false;
    return int.tryParse(this!) != null;
  }

  /// Check if the string is a double
  bool get isDouble {
    if (isNullOrEmpty()) return false;
    final value = double.tryParse(this!);
    return value != null && this!.contains(RegExp(r'[\.eE]'));
  }

  // ========== String Manipulation ==========

  /// Reverse the string
  String? reverse() {
    if (isNullOrEmpty()) return this;
    return this!.split('').reversed.join();
  }

  /// Check if the string is a palindrome
  bool get isPalindrome {
    if (isNullOrEmpty()) return false;
    final clean = this!.toLowerCase().removeWhitespace();
    return clean == clean!.split('').reversed.join();
  }

  /// Remove special characters, keep only letters, numbers, and spaces
  String? removeSpecialChars() {
    if (isNullOrEmpty()) return this;
    return this!.replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');
  }

  //==================Parsing==================//

  /// Parse string to int with default value
  int toIntOrDefault([int defaultValue = 0]) {
    if (isNullOrEmpty()) return defaultValue;
    return int.tryParse(this!) ?? defaultValue;
  }

  /// Parse string to double with default value
  double toDoubleOrDefault([double defaultValue = 0.0]) {
    if (isNullOrEmpty()) return defaultValue;
    return double.tryParse(this!) ?? defaultValue;
  }

  /// Convert to bool from common string patterns ("true", "false", "1", "0", "yes", "no")
  bool? toBoolOrNull() {
    if (isNullOrEmpty()) return null;
    final lower = this!.toLowerCase().trim();
    if (['true', '1', 'yes', 'y'].contains(lower)) return true;
    if (['false', '0', 'no', 'n'].contains(lower)) return false;
    return null;
  }

  /// Convert to num (int or double) or return 0 if invalid
  num toNumOrZero() {
    return num.tryParse(this ?? '') ?? 0;
  }
}

///==================================Other Extensions==================================//

extension IterableExtensions<T> on Iterable<T> {
  // Check if the iterable is null or empty
  bool get isNullOrEmpty => isEmpty;

  // Convert iterable to a comma-separated string
  String toCommaSeparatedString() {
    return join(', ');
  }
}

extension WidgetExtensions on Widget {
  /// Add tap gesture
  Widget onTap(VoidCallback onTap, {bool opaque = true}) {
    return GestureDetector(
      onTap: onTap,
      behavior: opaque ? HitTestBehavior.opaque : HitTestBehavior.deferToChild,
      child: this,
    );
  }

  /// Add long press gesture
  Widget onLongPress(VoidCallback onLongPress) {
    return GestureDetector(onLongPress: onLongPress, child: this);
  }

  /// Add double tap gesture
  Widget onDoubleTap(VoidCallback onDoubleTap) {
    return GestureDetector(onDoubleTap: onDoubleTap, child: this);
  }

  /// Wrap in Hero widget for page transitions
  Widget hero(String tag) {
    return Hero(tag: tag, child: this);
  }

  /// Constrain width and height
  Widget constrained({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth ?? 0,
        maxWidth: maxWidth ?? double.infinity,
        minHeight: minHeight ?? 0,
        maxHeight: maxHeight ?? double.infinity,
      ),
      child: this,
    );
  }
}

extension TextStyleExtension on TextStyle {
  // Utility methods to modify existing text styles
  TextStyle withColor(Color color) => copyWith(color: color);
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);
  TextStyle withSize(double size) => copyWith(fontSize: size);
  TextStyle withSpacing(double spacing) => copyWith(letterSpacing: spacing);
  TextStyle withHeight(double height) => copyWith(height: height);

  /// Apply shadow to text
  TextStyle withShadow({
    Color color = Colors.black26,
    double blurRadius = 2.0,
    Offset offset = const Offset(1, 1),
  }) => copyWith(
    shadows: [Shadow(color: color, blurRadius: blurRadius, offset: offset)],
  );
}

extension ColorUtils on Color {
  Color lighten([double amount = .1]) {
    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness(
      (hsl.lightness + amount).clamp(0.0, 1.0),
    );
    return hslLight.toColor();
  }

  Color darken([double amount = .1]) {
    return lighten(-amount);
  }
}

extension DebouncedTextController on TextEditingController {
  VoidCallback addDebouncedListener(
    VoidCallback callback, {
    Duration delay = const Duration(milliseconds: 500),
  }) {
    Timer? debounceTimer;

    void listener() {
      debounceTimer?.cancel();
      debounceTimer = Timer(delay, callback);
    }

    addListener(listener);

    // Return cleanup function
    return () {
      debounceTimer?.cancel();
      removeListener(listener);
    };
  }
}

extension ExFuture<T> on Future<T> {
  Future<T> trackTime(String label) async {
    final start = DateTime.now();
    final result = await this;
    final end = DateTime.now();
    final duration = end.difference(start);
    log('$label completed in ${duration.inMilliseconds} ms');
    return result;
  }
}
