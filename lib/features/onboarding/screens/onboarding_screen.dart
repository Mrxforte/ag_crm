import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var controller = PageController();

  // next button handler
  void nextHandler(int index) {
    if (index < 2) {
      controller.nextPage(duration: Durations.medium1, curve: Curves.bounceIn);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Hola")));
    }
  }

  // skip button handler

  void skipButtonHandler() {}

  int currentIndex = 0;

  // next button handler

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 10),
        child: FloatingActionButton(
          onPressed: () {
            nextHandler(currentIndex);
          },
          mini: true,
          shape: CircleBorder(),
          child: Icon(Icons.arrow_forward_ios),
        ),
      ),
      body: SizedBox(
        child: Stack(
          fit: StackFit.expand,
          children: [
            PageView(
              onPageChanged: onPageChanged,
              controller: controller,
              children: [
                // List of onBoarding Screens
                OnboardingWidget(
                  title: "Apple",
                  description:
                      "Proident sunt nisi velit et laboris.Pariatur non laboris anim pariatur nisi nostrud ut proident occaecat amet dolor nullaIrure magna non dolor amet.Commodo duis mollit esse consequat in voluptate ad ad veniam et sit.Duis ullamco cillum minim non sit esse enim deserunt cupidatat duis aliqua ad culpa Lorem.Dolore nulla occaecat cupidatat nostrud est nisi ad ipsum in aute commodo in..",
                  image: "assets/images/onboarding_bg.png",
                ),
                OnboardingWidget(
                  title: "Facebook",
                  description:
                      "Proident sunt nisi velit et laboris.Pariatur non laboris anim pariatur nisi nostrud ut proident occaecat amet dolor nullaNon consequat cillum cillum pariatur.Ex sint magna dolore nostrud veniam et officia qui anim.Anim qui ex dolore anim quis exercitation dolor incididunt ad.Officia anim Lorem qui aliqua et et enim aliqua sunt..",
                  image: "assets/images/onboarding_bg.png",
                ),
                OnboardingWidget(
                  title: "Windows",
                  description:
                      "Proident sunt nisi velit et laboris.Pariatur non laboris anim pariatur nisi nostrud ut proident occaecat amet dolor nullaEsse culpa excepteur magna elit mollit eu.Voluptate fugiat elit esse mollit ad deserunt nulla dolor est Lorem amet id id.Sunt magna incididunt pariatur do mollit excepteur duis.Lorem incididunt cupidatat tempor dolor..",
                  image: "assets/images/onboarding_bg.png",
                ),
              ],
            ),

            // page indicator widget
            PageIndicatorWidget(controller: controller),
            // skip button
            Positioned(
              top: 70,
              right: 32,
              child: TextButton(
                onPressed: () {},
                child: Text("skip", style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      left: 32,
      child: SmoothPageIndicator(
        controller: controller,

        count: 3,
        effect: ScaleEffect(dotHeight: 6),
      ),
    );
  }
}

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 50),
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 30),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              letterSpacing: 0.5,
              wordSpacing: 0.5,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
