import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final Function onTab;
  const AnswerButton(this.text, this.onTab, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          onTab();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 5, 95, 137),
          foregroundColor: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(text, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
