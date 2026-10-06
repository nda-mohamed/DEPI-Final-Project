import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_color/app_color.dart';
import 'floating_greeting.dart';
import 'loading_dots.dart';
import '../onboarding_screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _floatController;

  static const List<Greeting> _greetings = [
    Greeting('Hola', Alignment(-0.82, -0.86), -0.10),
    Greeting('Bonjour', Alignment(0.28, -0.93), 0.07),
    Greeting('Ciao', Alignment(-0.22, -0.68), 0.05),
    Greeting('Olá', Alignment(0.90, -0.64), -0.09),
    Greeting('Hallo', Alignment(-0.92, -0.50), -0.04),
    Greeting('Hej', Alignment(0.48, -0.46), 0.10),
  ];

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _navigateToNext();
  }

  void _navigateToNext() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => OnBoardingScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Stack(
          children: [
            // Floating greetings
            for (int i = 0; i < _greetings.length; i++)
              FloatingGreeting(
                data: _greetings[i],
                index: i,
                total: _greetings.length,
                controller: _floatController,
              ),

            // Center branding
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColor.background,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 24,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.translate_rounded,
                        color: AppColor.primary,
                        size: 48,
                      ),
                    ),

                    const SizedBox(height: 28),

                    Text(
                      'AI-Lingo',
                      style: GoogleFonts.bricolageGrotesque(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1,
                        color: AppColor.background,
                      ),
                    ),

                    const SizedBox(height: 10),

                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 280),
                      child: Text(
                        'Speak like a local. Learn through real conversations.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: AppColor.background.withValues(alpha: 0.85),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Positioned(
              left: 0,
              right: 0,
              bottom: 32,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LoadingDots(controller: _floatController),
                  const SizedBox(height: 14),
                  Text(
                    'POWERED BY AI',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.6,
                      color: AppColor.background.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}