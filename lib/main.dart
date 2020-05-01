import 'package:financy/screen/Authantication/ContinueOfRegister.dart';
import 'package:financy/screen/Authantication/login.dart';
import 'package:financy/screen/Authantication/regiester.dart';
import 'package:financy/screen/Authantication/security_quetion.dart';
import 'package:financy/screen/dashboard.dart';
import 'package:financy/screen/onboarding/onboardinScreen.dart';
import 'package:flutter/material.dart';
import './screen/Authantication/Stepper.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingScreen.id,
      routes: {
        OnboardingScreen.id: (context) => OnboardingScreen(),
        Dashboard.id: (context) => Dashboard(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id:(context)=>RegisterPage(),
        RegisterIdentify.id:(context)=>RegisterIdentify(),
        TabsView.id:(context)=>TabsView(),
        Securityquetion.id:(context)=>Securityquetion()
      },
    );
  }
}
