import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:splash2/splash/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int onboarding = 0;

Future initOnboarding() async {
  final prefs = await SharedPreferences.getInstance();

  int? onboard = prefs.getInt('onboarding');
  print('onboard : $onboard');
  if (onboard != null && onboard == 1) {
    return onboarding = 1;
  }
  prefs.setInt(('onboarding'), 1);
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 16.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      bodyFlex: 2,
      imageFlex: 3,
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
            title: "1",
            body:
                "Contoh",
            image: Image.asset("assets/onboarding1.png"),
            decoration: pageDecoration),
        PageViewModel(
            title: "2",
            body:
                "contoh",
            image: Image.asset("assets/onboarding2.png"),
            decoration: pageDecoration),
        PageViewModel(
          title: "3",
          body:
              "contoh",
          image: Image.asset("assets/onboarding3.png"),
          decoration: pageDecoration,
          footer: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (builer) {
                return WelcomeScreen();
              }));
            },
            child: Text('Get Started'),
          ),
        ),
      ],
      onDone: () {},
      showSkipButton: true,
      showNextButton: false,
      showDoneButton: false,
      showBackButton: false,
      dotsFlex: 3,
      back: Icon(Icons.arrow_back),
      skip: Text(
        'Skip',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      next: Icon(Icons.arrow_forward),
      done: Text(
        'Done',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      dotsDecorator: DotsDecorator(
          size: Size(10, 10),
          color: Colors.grey,
          activeSize: Size(22, 10),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)))),
    );
  }
}
