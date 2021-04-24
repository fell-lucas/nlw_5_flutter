import 'package:flutter/material.dart';
import 'package:nlw_5_flutter/core/app_gradients.dart';
import 'package:nlw_5_flutter/core/core.dart';
import 'package:nlw_5_flutter/home/home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500)).then(
      (_) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      ),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
