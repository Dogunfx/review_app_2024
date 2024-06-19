import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_app_2024/apps/avd_basic/components/answer_button.dart';
import 'package:review_app_2024/apps/avd_basic/models/db.dart';

class QuestionScreen extends StatefulWidget {
  final Function chooseAnswer;
  const QuestionScreen(this.chooseAnswer, {super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.chooseAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: GoogleFonts.abel(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          ...currentQuestion.getShuffleList().map(
                (answer) => AnswerButton(answer, () {
                  answerQuestion(answer);
                }),
              ),
        ],
      ),
    );
  }
}
