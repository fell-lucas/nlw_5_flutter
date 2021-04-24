import 'package:flutter/material.dart';

import 'package:nlw_5_flutter/core/app_colors.dart';
import 'package:nlw_5_flutter/core/core.dart';
import 'package:nlw_5_flutter/shared/models/answer_model.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final VoidCallback onTap;
  final bool disabled;

  const AnswerWidget({
    Key? key,
    required this.answer,
    this.isSelected = false,
    required this.onTap,
    required this.disabled,
  }) : super(key: key);

  Color get _selectedColorCorrect => answer.isCorrect ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderCorrect => answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardCorrect => answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardCorrect => answer.isCorrect ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleCorrect => answer.isCorrect ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconCorrect => answer.isCorrect ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.linear,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? _selectedColorCardCorrect : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                BorderSide(color: isSelected ? _selectedBorderCardCorrect : AppColors.border),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    answer.title,
                    style: isSelected ? _selectedTextStyleCorrect : AppTextStyles.body,
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isSelected ? _selectedColorCorrect : AppColors.white,
                    border: Border.fromBorderSide(
                      BorderSide(color: isSelected ? _selectedBorderCorrect : AppColors.border),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: isSelected
                      ? Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: _selectedColorCorrect.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 15,
                            )
                          ]),
                          child: Icon(
                            _selectedIconCorrect,
                            size: 16,
                            color: AppColors.white,
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
