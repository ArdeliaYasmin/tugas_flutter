import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:splash/splash/welcome_screen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 16.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      titlePadding: EdgeInsets.only(bottom: 24.0),
      bodyFlex: 2,
      imageFlex: 3,
      imageAlignment: Alignment.center,
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      pages: [
        PageViewModel(
          title: "Belajar Dari Ahlinya",
          body:
              "Pembelajaran dimentori oleh para ahli pada bidangnya masing-masing",
          image: Image.asset("assets/onboarding1.png"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Akses Modul Sepuasnya",
          body: "Modul berlimpah yang bebas diakses dimanapun dan kapanpun",
          image: Image.asset("assets/onboarding2.png"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kelas Bersertifikat",
          body:
              "Ikuti kelas, kerjakan tugas dan kuis untuk mendapatkan sertifikat",
          image: Image.asset("assets/onboarding3.png"),
          decoration: pageDecoration,
          footer: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (builer) {
                    return WelcomeScreen();
                  },
                ),
              );
            },
            child: const Text(
              'Daftar',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
      onDone: () {},
      showSkipButton: true,
      showNextButton: false,
      showDoneButton: false,
      showBackButton: false,
      dotsFlex: 2,
      back: const Icon(Icons.arrow_back),
      skip: const Text(
        'Lewati',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      next: const Icon(Icons.arrow_forward),
      done: const Text(
        'Selesai',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      dotsDecorator: const DotsDecorator(
          size: Size.square(10.0),
          activeSize: Size(22, 10),
          color: Colors.grey,
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)))),
    );
  }
}
