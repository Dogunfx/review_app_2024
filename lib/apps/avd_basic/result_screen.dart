import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_app_2024/apps/avd_basic/components/question_summary.dart';
import 'package:review_app_2024/apps/avd_basic/models/db.dart';

class ResultScreen extends StatelessWidget {
  final Function switchScreen;
  final List<String> chosenAnswers;
  const ResultScreen(this.switchScreen,
      {super.key, required this.chosenAnswers});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].question,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final y = questions.length;
    final x = getSummaryData()
        .where((element) => element['correct_answer'] == element['user_answer'])
        .length;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Your Result So far:  You got $x out of $y correctly",
            style: GoogleFonts.abel(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 10),
          QuestionSummary(summaryData: getSummaryData()),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              switchScreen(1, reset: true);
            },
            child: const Text("Restart Quiz"),
          ),
        ],
      ),
    );
  }
}
