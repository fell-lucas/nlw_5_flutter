import 'package:flutter/material.dart';
import 'package:nlw_5_flutter/challenge/widgets/answer/answer_widget.dart';
import 'package:nlw_5_flutter/core/core.dart';
import 'package:nlw_5_flutter/shared/models/question_model.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;
  const QuizWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 32),
              child: Expanded(
                child: Text(
                  question.title,
                  style: AppTextStyles.heading20,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          ...question.answers
              .map(
                (e) => AnswerWidget(
                  isCorrect: e.isCorrect,
                  title: e.title,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
