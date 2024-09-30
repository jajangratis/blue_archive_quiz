import 'package:flutter/material.dart';
import 'package:blue_archive_quiz/quiz.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String quizScreenRoute = '/quiz-screen';
  static const String aboutScreenRoute = '/about-screen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Blue Archive Quiz',
        theme: theme,
        // Define initial route
        initialRoute: '/quiz-screen',
        // Define routes
        routes: {
          quizScreenRoute: (context) => Quiz(() {
            Navigator.pushReplacementNamed(context, '/question-screen');
          }),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Center(
                child: Text('Route not found: ${settings.name}'),
              ),
            ),
          );
        },
    );
  }
}