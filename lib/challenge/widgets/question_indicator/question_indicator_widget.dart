import 'package:flutter/material.dart';
import 'package:nlw_5_flutter/core/core.dart';
import 'package:nlw_5_flutter/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int length;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão $currentPage",
                style: AppTextStyles.bodylightGrey15,
              ),
              Text(
                "de $length",
                style: AppTextStyles.bodylightGrey15,
              ),
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(value: currentPage / length),
        ],
      ),
    );
  }
}
