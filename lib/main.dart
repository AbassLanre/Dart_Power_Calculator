import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:power_calc/screen/home_page.dart';

void main() {

  runApp(MaterialApp(
    title: "Power Calculator",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Nunito',
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: AnimatedSplashScreen(
      duration: 200,
      splashIconSize: 300.0,
      splash: 'images/logo.jpg',
      nextScreen: const HomePage(),
      splashTransition: SplashTransition.slideTransition,
    ) ,
    
    
  ));
}
