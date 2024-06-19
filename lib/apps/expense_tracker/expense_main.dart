import 'package:flutter/material.dart';
import 'package:review_app_2024/apps/expense_tracker/expense_screen.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 171, 9, 9));

var kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 80, 2, 2),
    brightness: Brightness.dark);

class ExpenseMain extends StatelessWidget {
  const ExpenseMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
        )),
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.onPrimary,
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 18,
              ),
            ),
      ),
      home: const ExpensesScreen(),
    );
  }
}
