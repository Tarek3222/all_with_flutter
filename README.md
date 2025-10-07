🚀 Flutter Power Extensions
<div align="center">
A comprehensive collection of Dart extensions to supercharge your Flutter development
Show Image
Show Image
Show Image
Write cleaner, more expressive Flutter code with powerful extension methods
</div>

📋 Table of Contents

Overview
Features
Installation
Extensions Guide

BuildContext Extensions
DateTime Extensions
String Extensions
Widget Extensions
TextStyle Extensions
Color Extensions
Utility Extensions


Usage Examples
Best Practices
Contributing


🌟 Overview
This package provides a rich set of extension methods that reduce boilerplate, improve code readability, and make Flutter development more enjoyable. Say goodbye to verbose code and hello to elegant, expressive syntax!
Why Use These Extensions?

✅ Less Boilerplate - Write 50% less code
✅ Better Readability - Self-documenting, chainable methods
✅ Type Safety - Full Dart type system support
✅ Performance - Zero runtime overhead
✅ Production Ready - Battle-tested in real applications


🎯 Features
🧭 Navigation Made Simple
dart// Before
Navigator.of(context).push(MaterialPageRoute(builder: (_) => DetailPage()));

// After
context.push(DetailPage());
🎨 Easy Theme Access
dart// Before
Theme.of(context).colorScheme.primary

// After
context.colorScheme.primary
📱 Responsive Design
dart// Adaptive values based on screen size
final padding = context.responsive(
  mobile: 16.0,
  tablet: 24.0,
  desktop: 32.0,
);
✅ String Validation
dartif (email.isValidEmail) {
  // Process email
}

📦 Installation

Copy the extensions file to your project:

   lib/utils/extensions.dart

Import in your files:

dart   import 'utils/extensions.dart';

Start using - No additional configuration needed!


📚 Extensions Guide
1️⃣ BuildContext Extensions
🧭 Navigation
MethodDescriptionExamplepush()Navigate to new screencontext.push(HomePage())pushReplacement()Replace current screencontext.pushReplacement(LoginPage())pushAndRemoveAll()Clear stack & navigatecontext.pushAndRemoveAll(MainPage())pop()Go backcontext.pop()popToFirst()Return to first screencontext.popToFirst()canPopCheck if can go backif (context.canPop) ...
Named Routes:
dartcontext.pushNamed('/details', arguments: userId);
context.pushReplacementNamed('/home');
context.pushNamedAndRemoveUntil('/login', predicate: (_) => false);
🎨 Theme & Colors
dart// Quick access to theme properties
final primaryColor = context.colorScheme.primary;
final textStyle = context.textTheme.headlineMedium;
final isDark = context.isDarkMode;
📱 Screen Dimensions
dart// Screen size
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
📐 Responsive Breakpoints
dart// Device type checks
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
⌨️ Focus Management
dartcontext.unfocus();  // Dismiss keyboard
context.requestFocus(myFocusNode);
final hasFocus = context.hasFocus;
🎭 Scaffold Actions
dartcontext.openDrawer();
context.openEndDrawer();
context.closeDrawer();
context.closeEndDrawer();

2️⃣ DateTime Extensions
📅 Date Checks
dartfinal date = DateTime.now();

if (date.isToday) { ... }
if (date.isYesterday) { ... }
if (date.isTomorrow) { ... }
if (date.isPast) { ... }
if (date.isFuture) { ... }
⏱️ Time Calculations
dartfinal daysDiff = date1.daysBetween(date2);
final hoursDiff = date1.hoursBetween(date2);
final minutesDiff = date1.minutesBetween(date2);
🔄 Date Manipulation
dartfinal nextWeek = DateTime.now().addDays(7);
final lastMonth = DateTime.now().subtractDays(30);
final tomorrow = DateTime.now().addHours(24);
📆 Month Boundaries
dartfinal firstDay = DateTime.now().firstDayOfMonth;
final lastDay = DateTime.now().lastDayOfMonth;
🕐 Human-Readable Time
dartfinal timeAgo = date.timeAgo;
// "just now", "5 min ago", "2 hours ago", "3 days ago", etc.

3️⃣ String Extensions
✅ Validation
dart// Email validation
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
🔍 Null Checks
dartif (text.isNullOrEmpty()) { ... }
if (text.isNullOrBlank()) { ... }  // Includes whitespace check
✨ Text Transformation
dartfinal capitalized = "hello".capitalize();  // "Hello"
final titleCase = "hello world".capitalizeEachWord();  // "Hello World"
final noSpaces = "hello world".removeWhitespace();  // "helloworld"
final clean = "  hello   world  ".removeExtraSpaces();  // "hello world"
final reversed = "hello".reverse();  // "olleh"
final numbersOnly = "abc123xyz".extractNumbers();  // "123"
final alphanumeric = "hello@world!".removeSpecialChars();  // "helloworld"
🔢 Parsing
dartfinal age = "25".toIntOrDefault(0);  // 25
final price = "19.99".toDoubleOrDefault(0.0);  // 19.99
final count = "invalid".toIntOrDefault(10);  // 10 (default)
final value = "42".toNumOrZero();  // 42

// Boolean parsing
final isActive = "true".toBoolOrNull();  // true
final isEnabled = "yes".toBoolOrNull();  // true
final isFalse = "0".toBoolOrNull();  // false
🎯 String Analysis
dartif ("racecar".isPalindrome) { ... }  // true

4️⃣ Widget Extensions
👆 Gesture Detection
dart// Tap gesture
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
🦸 Hero Animations
dartImage.network(url).hero('image-tag');
📏 Constraints
dartMyWidget().constrained(
  minWidth: 100,
  maxWidth: 300,
  minHeight: 50,
  maxHeight: 200,
);

5️⃣ TextStyle Extensions
dartfinal style = TextStyle(fontSize: 16);

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

6️⃣ Color Extensions
dartfinal color = Colors.blue;

// Lighten/Darken colors
final lighter = color.lighten(0.2);  // 20% lighter
final darker = color.darken(0.2);    // 20% darker

7️⃣ Utility Extensions
📝 TextEditingController - Debounced Listener
dartfinal controller = TextEditingController();

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
⏱️ Future - Performance Tracking
dartawait fetchData()
  .trackTime('API Call');
// Logs: "API Call completed in 342 ms"
📚 Iterable Extensions
dartfinal items = ['apple', 'banana', 'orange'];

if (items.isNullOrEmpty) { ... }

final csv = items.toCommaSeparatedString();
// "apple, banana, orange"

💡 Usage Examples
Example 1: Login Screen Navigation
dartvoid handleLogin() async {
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
Example 2: Responsive Layout
dartWidget build(BuildContext context) {
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
Example 3: Debounced Search
dartclass SearchScreen extends StatefulWidget {
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
Example 4: Time Display
dartWidget buildMessageTime(DateTime timestamp) {
  return Text(
    timestamp.timeAgo,
    style: context.textTheme.bodySmall?.withColor(
      context.colorScheme.onSurface.withOpacity(0.6),
    ),
  );
}

⚡ Best Practices
✅ DO

Use context.responsive() for values, not widget building
Cache computed values when possible
Use debounced listeners for text fields with real-time search
Check context.canPop before calling pop()
Use .isNullOrEmpty() for safe null checks

❌ DON'T

Don't use MediaQuery extensions in build methods that rebuild frequently
Don't forget to cleanup debounced listeners
Don't use responsive() for building different widgets (use LayoutBuilder instead)
Don't modify the breakpoint values without updating all usages

🎯 Performance Tips

MediaQuery usage: Methods like context.width can trigger rebuilds. Use sparingly or cache values.
Theme access: context.theme is cached by Flutter, safe to use frequently.
String validation: Regex operations are fast but avoid in tight loops.


🤝 Contributing
Contributions are welcome! Here's how you can help:

Fork the repository
Create a feature branch: git checkout -b feature/AmazingFeature
Commit your changes: git commit -m 'Add some AmazingFeature'
Push to the branch: git push origin feature/AmazingFeature
Open a Pull Request

Ideas for Contributions

Add more validation patterns (credit cards, zip codes, etc.)
Additional date formatting options
More color manipulation methods
Platform-specific extensions
Localization support


📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

🙏 Acknowledgments
Built with ❤️ for the Flutter community
If you find this useful, please give it a ⭐ on GitHub!

<div align="center">
Happy Coding! 🚀
Made with Flutter | Powered by Dart Extensions
Report Bug · Request Feature
</div>
