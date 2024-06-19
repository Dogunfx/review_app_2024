import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: summaryData.map((data) {
              final color = data['correct_answer'] == data['user_answer']
                  ? const Color.fromARGB(255, 0, 95, 3)
                  : const Color.fromARGB(255, 120, 13, 5);
              final textStyle = GoogleFonts.abel(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w100);
              String question = data["question"] as String;
              String user_answer = data["user_answer"] as String;
              String correct_answer = data["correct_answer"] as String;
              int question_index = data['question_index'] as int;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: color,
                    ),
                    child: Text(
                      (question_index + 1).toString(),
                      textAlign: TextAlign.center,
                      style: textStyle,
                    ),
                  ),
                  Container(
                    width: 400,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(question, textAlign: TextAlign.left),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            user_answer,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.abel(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: color,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(width: 2))),
                          child: Text(correct_answer,
                              textAlign: TextAlign.left, style: textStyle),
                        ),
                        const SizedBox(height: 20)
                      ],
                    ),
                  )
                ],
              );
            }).toList()),
      ),
    );
  }
}
