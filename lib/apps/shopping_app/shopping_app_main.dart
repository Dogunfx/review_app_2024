import 'package:flutter/material.dart';
import 'package:review_app_2024/apps/shopping_app/widgets/grocery_list.dart';

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Groceries',
        theme: ThemeData.dark().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 147, 229, 250),
            brightness: Brightness.dark,
            surface: const Color.fromARGB(255, 42, 51, 59),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
        ),
        home: const GroceryList());
  }
}
