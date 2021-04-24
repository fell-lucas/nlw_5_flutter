import 'package:flutter/material.dart';

import 'package:nlw_5_flutter/challenge/challenge_page.dart';
import 'package:nlw_5_flutter/core/app_colors.dart';
import 'package:nlw_5_flutter/home/home_controller.dart';
import 'package:nlw_5_flutter/home/home_state.dart';
import 'package:nlw_5_flutter/home/widgets/appbar/app_bar_widget.dart';
import 'package:nlw_5_flutter/home/widgets/level_button/level_button_widget.dart';
import 'package:nlw_5_flutter/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    int width4 = 800;
    final double width = MediaQuery.of(context).size.width;

    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    LevelButtonWidget(label: "Fácil"),
                    SizedBox(width: 8),
                    LevelButtonWidget(label: "Médio"),
                    SizedBox(width: 8),
                    LevelButtonWidget(label: "Difícil"),
                    SizedBox(width: 8),
                    LevelButtonWidget(label: "Perito"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map(
                        (e) => QuizCardWidget(
                          title: e.title,
                          completed: "${e.questionsAnswered}/${e.questions.length}",
                          percent: e.questionsAnswered / e.questions.length,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChallengePage(
                                  questions: e.questions,
                                  title: e.title,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
