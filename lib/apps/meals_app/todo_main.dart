import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:review_app_2024/apps/meals_app/screens/categories.dart';
import 'package:review_app_2024/apps/meals_app/screens/tabs.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const TabsScreen()); // Todo ...,
  }
}
