import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:review_app_2024/apps/meals_app/todo_main.dart';
import 'package:review_app_2024/apps/shopping_app/shopping_app_main.dart';

void main() {
  runApp(const ProviderScope(
    child: ShoppingApp(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Meals'),
        ),
        body: const TodoApp(),
      ),
    );
  }
}
