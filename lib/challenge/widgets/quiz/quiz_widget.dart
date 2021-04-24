import 'package:flutter/material.dart';

import 'package:nlw_5_flutter/challenge/widgets/answer/answer_widget.dart';
import 'package:nlw_5_flutter/core/core.dart';
import 'package:nlw_5_flutter/shared/models/answer_model.dart';
import 'package:nlw_5_flutter/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedIndex = -1;

  AnswerModel answer(int index) => widget.question.answers[index];

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
                  widget.question.title,
                  style: AppTextStyles.heading20,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: answer(i),
              disabled: selectedIndex != -1,
              isSelected: selectedIndex == i,
              onTap: () {
                selectedIndex = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1)).then((value) => widget.onChange());
              },
            ),
        ],
      ),
    );
  }
}
