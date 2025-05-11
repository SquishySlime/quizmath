import 'package:flutter/material.dart';
import 'screens/leaderboard_screen.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/learning_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 // notifikasi jam 20:00
  runApp(const MathQuizApp());
}

class MathQuizApp extends StatefulWidget {
  const MathQuizApp({super.key});

  @override
  State<MathQuizApp> createState() => _MathQuizAppState();
}

class _MathQuizAppState extends State<MathQuizApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _changeTheme(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Math',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.light(
          primary: Colors.deepPurple,
          secondary: Colors.amber,
          surface: Color(0xFFF8F8FA),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F8FA),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
        iconTheme: const IconThemeData(color: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        cardColor: Colors.white,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.dark(
          primary: Colors.deepPurple,
          secondary: Colors.amber,
          surface: Color(0xFF232336),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFF181829),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.amber),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF232336),
          foregroundColor: Colors.amber,
          iconTheme: IconThemeData(color: Colors.amber),
          titleTextStyle: TextStyle(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        cardColor: Color(0xFF232336),
      ),
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => HomeScreen(onThemeChanged: _changeTheme, currentThemeMode: _themeMode),
        '/leaderboard': (context) => const LeaderboardScreen(),
        '/learning': (context) => const LearningScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
