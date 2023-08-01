import 'package:flutter/material.dart';
import 'package:food_app_folkatech/common/colors.dart';
import 'package:food_app_folkatech/common/router/routes.dart';
import 'package:food_app_folkatech/common/text_widget/text_widget.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.of(context).pushNamedAndRemoveUntil(
              Routes.home,
              (route) => false,
            ));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/animation/splash_screen_logo.json',
                height: 120),
            TextWidget.mainBold('FOOD APP', color: ConstColors.green50),
            const SizedBox(
              height: 50,
            ),
            TextWidget.small(
              'by Ignasius Santoni M Rajagukguk',
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget.smallBold(
              'Made for Folkatech – Flutter Test',
            ),
          ],
        ),
      ),
    );
  }
}
