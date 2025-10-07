// Iterable Extensions
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

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
