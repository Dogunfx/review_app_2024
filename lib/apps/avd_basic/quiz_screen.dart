import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  final Function switcherHandler;
  const QuizScreen({required this.switcherHandler, super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 150,
            color: const Color.fromARGB(82, 255, 255, 255),
          ),
          const SizedBox(height: 25),
          Text("Learn Flutter the fun way",
              style: GoogleFonts.abel(
                fontSize: 24,
                color: Colors.white,
              )),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              widget.switcherHandler(2);
            },
            child: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
