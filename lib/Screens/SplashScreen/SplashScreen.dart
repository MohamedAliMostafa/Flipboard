import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Screens/Home.dart';

class Splash extends StatelessWidget {
  static const String routeName="s";


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: double.infinity,
      splash:
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60,vertical: 220),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40),bottomRight: Radius.circular(40)),
                border: Border.all(color: Colors.black87),
                  image: const DecorationImage(image: AssetImage("assets/images/splash.jpeg")),
              ),
    ),
      nextScreen: HomeScreen(),
      splashTransition: SplashTransition.sizeTransition,
    );
  }
}
