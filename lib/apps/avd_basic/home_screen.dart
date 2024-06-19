import 'package:flutter/material.dart';
import 'package:review_app_2024/apps/avd_basic/models/db.dart';
import 'package:review_app_2024/apps/avd_basic/question_screen.dart';
import 'package:review_app_2024/apps/avd_basic/quiz_screen.dart';
import 'package:review_app_2024/apps/avd_basic/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> selectedAnswers = [];
  var activeScreen = 1;

  void switchScreen(int screen, {bool reset = false}) {
    setState(() {
      if (reset) {
        selectedAnswers = [];
      }
      activeScreen = screen;
    });
  }

  Widget getActiveScreen() {
    switch (activeScreen) {
      case 1:
        return QuizScreen(switcherHandler: switchScreen);
      case 2:
        return QuestionScreen(chooseAnswer);
      case 3:
        return ResultScreen(switchScreen, chosenAnswers: selectedAnswers);
      default:
        return const Placeholder();
    }
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz Game"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.bottomLeft,
              begin: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 32, 136, 181),
                Color.fromARGB(255, 88, 173, 204),
              ],
            ),
          ),
          child: getActiveScreen(),
        ),
      ),
    );
  }
}
