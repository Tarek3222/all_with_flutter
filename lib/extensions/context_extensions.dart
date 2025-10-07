import 'package:flutter/material.dart';

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
  /// (used it for responsive values like margin and padding not for build widget ❌❌ custmizate it by layout builder and pass widget as Widget Binding)
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
