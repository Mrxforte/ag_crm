import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: [
              // Skip Button
              Positioned(
                top: 10,
                right: 10,
                child: TextButton(onPressed: () {}, child: Text("Skip")),
              ),

              // List of onBoarding Screens
              OnboardingWidget(
                title: "Apple",
                description:
                    "Proident sunt nisi velit et laboris.Pariatur non laboris anim pariatur nisi nostrud ut proident occaecat amet dolor nulla.",
                image: "assets/images/onboarding_bg.png",
              ),
              OnboardingWidget(
                title: "Facebook",
                description:
                    "Proident sunt nisi velit et laboris.Pariatur non laboris anim pariatur nisi nostrud ut proident occaecat amet dolor nulla.",
                image: "assets/images/onboarding_bg.png",
              ),
              OnboardingWidget(
                title: "Windows",
                description:
                    "Proident sunt nisi velit et laboris.Pariatur non laboris anim pariatur nisi nostrud ut proident occaecat amet dolor nulla.",
                image: "assets/images/onboarding_bg.png",
              ),
            ],
          ),
        ],
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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [Image.asset(image), Text(title), Text(description)],
      ),
    );
  }
}
