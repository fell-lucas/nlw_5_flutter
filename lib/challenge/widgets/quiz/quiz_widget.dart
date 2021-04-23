import 'package:flutter/material.dart';
import 'package:nlw_5_flutter/challenge/widgets/answer/answer_widget.dart';
import 'package:nlw_5_flutter/core/core.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          AnswerWidget(
            isCorrect: false,
            isSelected: true,
            title: "Possibilita a criação de aplicativos compilados nativamente.",
          ),
          AnswerWidget(
            title: "Possibilita a criação de aplicativos compilados nativamente.",
          ),
          AnswerWidget(
            title: "Possibilita a criação de aplicativos compilados nativamente.",
          ),
          AnswerWidget(
            title: "Possibilita a criação de aplicativos compilados nativamente.",
          ),
        ],
      ),
    );
  }
}
