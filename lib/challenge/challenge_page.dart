import 'package:flutter/material.dart';
import 'package:nlw_5_flutter/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:nlw_5_flutter/challenge/widgets/quiz/quiz_widget.dart';
import 'package:nlw_5_flutter/home/widgets/quiz_card/quiz_card_widget.dart';

class ChallengePage extends StatefulWidget {
  ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          top: true,
          child: QuestionIndicatorWidget(),
        ),
      ),
      body: QuizWidget(title: "O que o Flutter faz em sua totalidade?"),
    );
  }
}
