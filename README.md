# 🚀 Flutter Power Extensions

<div align="center">

**A comprehensive collection of Dart extensions to supercharge your Flutter development**

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

*Write cleaner, more expressive Flutter code with powerful extension methods*

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Installation](#-installation)
- [Extensions Guide](#-extensions-guide)
  - [BuildContext Extensions](#1-buildcontext-extensions)
  - [DateTime Extensions](#2-datetime-extensions)
  - [String Extensions](#3-string-extensions)
  - [Widget Extensions](#4-widget-extensions)
  - [TextStyle Extensions](#5-textstyle-extensions)
  - [Color Extensions](#6-color-extensions)
  - [Utility Extensions](#7-utility-extensions)
- [Usage Examples](#-usage-examples)
- [Best Practices](#-best-practices)
- [Contributing](#-contributing)

---

## 🌟 Overview

This package provides a rich set of extension methods that reduce boilerplate, improve code readability, and make Flutter development more enjoyable. Say goodbye to verbose code and hello to elegant, expressive syntax!

### Why Use These Extensions?

- ✅ **Less Boilerplate** - Write 50% less code
- ✅ **Better Readability** - Self-documenting, chainable methods
- ✅ **Type Safety** - Full Dart type system support
- ✅ **Performance** - Zero runtime overhead
- ✅ **Production Ready** - Battle-tested in real applications

---

## 🎯 Features

### 🧭 Navigation Made Simple
```dart
// Before
Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailPage()));

// After
context.push(DetailPage());
```

### 🎨 Easy Theme Access
```dart
// Before
Theme.of(context).colorScheme.primary

// After
context.colorScheme.primary
```

### 📱 Responsive Design
```dart
// Adaptive values based on screen size
final padding = context.responsive(
  mobile: 16.0,
  tablet: 24.0,
  desktop: 32.0,
);
```

### ✅ String Validation
```dart
if (email.isValidEmail) {
  // Process email
}
```

---

## 📦 Installation

1. **Copy the extensions file** to your project:
   ```
   lib/utils/extensions.dart
   ```

2. **Import in your files**:
   ```dart
   import 'utils/extensions.dart';
   ```

3. **Start using** - No additional configuration needed!

---

## 📚 Extensions Guide

### 1️⃣ BuildContext Extensions

#### 🧭 Navigation

| Method | Description | Example |
|--------|-------------|---------|
| `push()` | Navigate to new screen | `context.push(HomePage())` |
| `pushReplacement()` | Replace current screen | `context.pushReplacement(LoginPage())` |
| `pushAndRemoveAll()` | Clear stack & navigate | `context.pushAndRemoveAll(MainPage())` |
| `pop()` | Go back | `context.pop()` |
| `popToFirst()` | Return to first screen | `context.popToFirst()` |
| `canPop` | Check if can go back | `if (context.canPop) ...` |

**Named Routes:**
```dart
context.pushNamed('/details', arguments: userId);
context.pushReplacementNamed('/home');
context.pushNamedAndRemoveUntil('/login', predicate: (_) => false);
```

#### 🎨 Theme & Colors

```dart
// Quick access to theme properties
final primaryColor = context.colorScheme.primary;
final textStyle = context.textTheme.headlineMedium;
final isDark = context.isDarkMode;
```

#### 📱 Screen Dimensions

```dart
// Screen size
final width = context.width;
final height = context.height;
final size = context.screenSize;

// System insets
final statusBarHeight = context.statusBarHeight;
final keyboardHeight = context.keyboardHeight;
final isKeyboardOpen = context.isKeyboardVisible;

// Percentage-based sizing
final halfWidth = context.widthPercent(50);  // 50% of screen width
final quarterHeight = context.heightPercent(25);  // 25% of screen height
```

#### 📐 Responsive Breakpoints

```dart
// Device type checks
if (context.isMobile) {
  // width < 600
}
if (context.isTablet) {
  // 600 <= width < 900
}
if (context.isDesktop) {
  // width >= 900
}

// Orientation
if (context.isPortrait) { ... }
if (context.isLandscape) { ... }

// Adaptive values
final fontSize = context.responsive(
  mobile: 14.0,
  tablet: 16.0,
  desktop: 18.0,
);
```

#### ⌨️ Focus Management

```dart
context.unfocus();  // Dismiss keyboard
context.requestFocus(myFocusNode);
final hasFocus = context.hasFocus;
```

#### 🎭 Scaffold Actions

```dart
context.openDrawer();
context.openEndDrawer();
context.closeDrawer();
context.closeEndDrawer();
```

---

### 2️⃣ DateTime Extensions

#### 📅 Date Checks

```dart
final date = DateTime.now();

if (date.isToday) { ... }
if (date.isYesterday) { ... }
if (date.isTomorrow) { ... }
if (date.isPast) { ... }
if (date.isFuture) { ... }
```

#### ⏱️ Time Calculations

```dart
final daysDiff = date1.daysBetween(date2);
final hoursDiff = date1.hoursBetween(date2);
final minutesDiff = date1.minutesBetween(date2);
```

#### 🔄 Date Manipulation

```dart
final nextWeek = DateTime.now().addDays(7);
final lastMonth = DateTime.now().subtractDays(30);
final tomorrow = DateTime.now().addHours(24);
```

#### 📆 Month Boundaries

```dart
final firstDay = DateTime.now().firstDayOfMonth;
final lastDay = DateTime.now().lastDayOfMonth;
```

#### 🕐 Human-Readable Time

```dart
final timeAgo = date.timeAgo;
// "just now", "5 min ago", "2 hours ago", "3 days ago", etc.
```

---

### 3️⃣ String Extensions

#### ✅ Validation

```dart
// Email validation
if (email.isValidEmail) { ... }

// Phone validation (Egyptian format)
if (phone.isValidPhone) { ... }

// Password validation
// Requires: 8+ chars, uppercase, lowercase, digit, special char
if (password.isValidPassword) { ... }

// URL validation
if (url.isValidUrl) { ... }

// Number checks
if (input.isNumeric) { ... }
if (input.isInt) { ... }
if (input.isDouble) { ... }
```

#### 🔍 Null Checks

```dart
if (text.isNullOrEmpty()) { ... }
if (text.isNullOrBlank()) { ... }  // Includes whitespace check
```

#### ✨ Text Transformation

```dart
final capitalized = "hello".capitalize();  // "Hello"
final titleCase = "hello world".capitalizeEachWord();  // "Hello World"
final noSpaces = "hello world".removeWhitespace();  // "helloworld"
final clean = "  hello   world  ".removeExtraSpaces();  // "hello world"
final reversed = "hello".reverse();  // "olleh"
final numbersOnly = "abc123xyz".extractNumbers();  // "123"
final alphanumeric = "hello@world!".removeSpecialChars();  // "helloworld"
```

#### 🔢 Parsing

```dart
final age = "25".toIntOrDefault(0);  // 25
final price = "19.99".toDoubleOrDefault(0.0);  // 19.99
final count = "invalid".toIntOrDefault(10);  // 10 (default)
final value = "42".toNumOrZero();  // 42

// Boolean parsing
final isActive = "true".toBoolOrNull();  // true
final isEnabled = "yes".toBoolOrNull();  // true
final isFalse = "0".toBoolOrNull();  // false
```

#### 🎯 String Analysis

```dart
if ("racecar".isPalindrome) { ... }  // true
```

---

### 4️⃣ Widget Extensions

#### 👆 Gesture Detection

```dart
// Tap gesture
MyWidget().onTap(() {
  print('Tapped!');
});

// Long press
MyWidget().onLongPress(() {
  print('Long pressed!');
});

// Double tap
MyWidget().onDoubleTap(() {
  print('Double tapped!');
});
```

#### 🦸 Hero Animations

```dart
Image.network(url).hero('image-tag');
```

#### 📏 Constraints

```dart
MyWidget().constrained(
  minWidth: 100,
  maxWidth: 300,
  minHeight: 50,
  maxHeight: 200,
);
```

---

### 5️⃣ TextStyle Extensions

```dart
final style = TextStyle(fontSize: 16);

// Chain modifications
final newStyle = style
  .withColor(Colors.blue)
  .withWeight(FontWeight.bold)
  .withSize(20)
  .withSpacing(1.5)
  .withHeight(1.5);

// Add shadow
final shadowStyle = style.withShadow(
  color: Colors.black26,
  blurRadius: 2.0,
  offset: Offset(1, 1),
);
```

---

### 6️⃣ Color Extensions

```dart
final color = Colors.blue;

// Lighten/Darken colors
final lighter = color.lighten(0.2);  // 20% lighter
final darker = color.darken(0.2);    // 20% darker
```

---

### 7️⃣ Utility Extensions

#### 📝 TextEditingController - Debounced Listener

```dart
final controller = TextEditingController();

// Add debounced search
final cleanup = controller.addDebouncedListener(
  () {
    print('Search: ${controller.text}');
  },
  delay: Duration(milliseconds: 500),
);

// Don't forget to cleanup
@override
void dispose() {
  cleanup();  // Remove listener and cancel timer
  controller.dispose();
  super.dispose();
}
```

#### ⏱️ Future - Performance Tracking

```dart
await fetchData()
  .trackTime('API Call');
// Logs: "API Call completed in 342 ms"
```

#### 📚 Iterable Extensions

```dart
final items = ['apple', 'banana', 'orange'];

if (items.isNullOrEmpty) { ... }

final csv = items.toCommaSeparatedString();
// "apple, banana, orange"
```

---

## 💡 Usage Examples

### Example 1: Login Screen Navigation

```dart
void handleLogin() async {
  if (email.isNullOrEmpty() || !email.isValidEmail) {
    // Show error
    return;
  }
  
  if (password.isNullOrEmpty() || !password.isValidPassword) {
    // Show error
    return;
  }
  
  final success = await login(email!, password!);
  
  if (success) {
    context.pushAndRemoveAll(HomePage());
  }
}
```

### Example 2: Responsive Layout

```dart
Widget build(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(
      context.responsive(
        mobile: 16.0,
        tablet: 24.0,
        desktop: 32.0,
      ),
    ),
    child: Column(
      children: [
        Text(
          'Welcome',
          style: context.textTheme.headlineMedium?.withColor(
            context.colorScheme.primary,
          ),
        ),
        SizedBox(height: context.heightPercent(5)),
        if (context.isMobile) MobileView(),
        if (context.isTablet) TabletView(),
        if (context.isDesktop) DesktopView(),
      ],
    ),
  );
}
```

### Example 3: Debounced Search

```dart
class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  late VoidCallback _cleanup;
  
  @override
  void initState() {
    super.initState();
    _cleanup = _controller.addDebouncedListener(
      _performSearch,
      delay: Duration(milliseconds: 300),
    );
  }
  
  void _performSearch() {
    final query = _controller.text;
    if (!query.isNullOrBlank()) {
      // Perform search
    }
  }
  
  @override
  void dispose() {
    _cleanup();
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(hintText: 'Search...'),
    );
  }
}
```

### Example 4: Time Display

```dart
Widget buildMessageTime(DateTime timestamp) {
  return Text(
    timestamp.timeAgo,
    style: context.textTheme.bodySmall?.withColor(
      context.colorScheme.onSurface.withOpacity(0.6),
    ),
  );
}
```

---

## ⚡ Best Practices

### ✅ DO

- Use `context.responsive()` for values, not widget building
- Cache computed values when possible
- Use debounced listeners for text fields with real-time search
- Check `context.canPop` before calling `pop()`
- Use `.isNullOrEmpty()` for safe null checks

### ❌ DON'T

- Don't use MediaQuery extensions in build methods that rebuild frequently
- Don't forget to cleanup debounced listeners
- Don't use `responsive()` for building different widgets (use LayoutBuilder instead)
- Don't modify the breakpoint values without updating all usages

### 🎯 Performance Tips

1. **MediaQuery usage**: Methods like `context.width` can trigger rebuilds. Use sparingly or cache values.
2. **Theme access**: `context.theme` is cached by Flutter, safe to use frequently.
3. **String validation**: Regex operations are fast but avoid in tight loops.

---

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/AmazingFeature`
3. **Commit your changes**: `git commit -m 'Add some AmazingFeature'`
4. **Push to the branch**: `git push origin feature/AmazingFeature`
5. **Open a Pull Request**

### Ideas for Contributions

- Add more validation patterns (credit cards, zip codes, etc.)
- Additional date formatting options
- More color manipulation methods
- Platform-specific extensions
- Localization support


---

## 🙏 Acknowledgments

Built with me ❤️ for the Flutter community

**If you find this useful, please give it a ⭐ on GitHub!**

---

<div align="center">

### Happy Coding! 🚀

Made with Flutter | Powered by Dart Extensions

[Report Bug](../../issues) · [Request Feature](../../issues)

</div>
