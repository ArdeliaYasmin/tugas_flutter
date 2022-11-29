import 'package:flutter/material.dart';
import 'package:splash2/splash/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    startAnimation();
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });

    await Future.delayed(const Duration(milliseconds: 5000));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OnboardingPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 1600),
            opacity: animate ? 1 : 0,
            child: Image(
              image: AssetImage("assets/splash_icon.png"),
            ),
          ),
        ),
      ),
    );
  }
}
