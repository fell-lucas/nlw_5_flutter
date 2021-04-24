import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nlw_5_flutter/core/app_colors.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final Color rippleColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.rippleColor,
    required this.onTap,
  }) : super(key: key);

  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.darkGreen,
        this.rippleColor = AppColors.darkGreenAccent,
        this.borderColor = AppColors.green,
        this.fontColor = AppColors.white,
        this.onTap = onTap,
        this.label = label;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.white,
        this.borderColor = AppColors.border,
        this.rippleColor = AppColors.border,
        this.fontColor = AppColors.grey,
        this.onTap = onTap,
        this.label = label;

  NextButtonWidget.purple({required String label, required VoidCallback onTap})
      : this.backgroundColor = AppColors.purple,
        this.rippleColor = AppColors.purpleAccent,
        this.borderColor = AppColors.border,
        this.fontColor = AppColors.white,
        this.onTap = onTap,
        this.label = label;

  NextButtonWidget.transparent({required String label, required VoidCallback onTap})
      : this.backgroundColor = Colors.transparent,
        this.borderColor = Colors.transparent,
        this.rippleColor = AppColors.border,
        this.fontColor = AppColors.grey,
        this.onTap = onTap,
        this.label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith((states) => rippleColor),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
            side: MaterialStateProperty.all(BorderSide(color: borderColor))),
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}
