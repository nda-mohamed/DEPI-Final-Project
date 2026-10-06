import 'package:depi_final_project/core/widgets/onboarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_color/app_color.dart';
import '../../core/widgets/onboarding_action_button.dart';
import '../signup_screen/signup_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  final List<OnBoardingPageWidget> pages = const [
    OnBoardingPageWidget(
      image: 'assets/images/onboarding/onboarding1.png',
      title: 'Real conversations\nnot flashcards',
      description:
          'Role-play everyday moments with an AI\npartner that adapts to your level and\ncorrects you gently.',
    ),
    OnBoardingPageWidget(
      image: 'assets/images/onboarding/onboarding2.png',
      title: 'Speak out loud\nget feedback instantly',
      description:
          'Pronunciation scoring, grammar tips and\nnatural phrasing suggestions after every\nreply.',
    ),
    OnBoardingPageWidget(
      image: 'assets/images/onboarding/onboarding3.png',
      title: 'Watch your fluency\ngrow every day',
      description:
          'Streaks, XP and a smart vocabulary vault\nkeep you coming back and\nremembering more.',
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onNextPressed() {
    if (currentIndex < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignupScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(backgroundColor: AppColor.background),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return pages[index];
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Indicator Dots
                Row(
                  children: List.generate(
                    pages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.only(right: 6),
                      height: 8,
                      width: currentIndex == index ? 30 : 8,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? AppColor.primary
                            : AppColor.primary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),

                // Next Button
                OnBoardingActionButton(
                  isLastPage: currentIndex == pages.length - 1,
                  onPressed: onNextPressed,
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
