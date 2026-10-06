import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_color/app_color.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Image.asset(image, fit: BoxFit.cover),
        ),

        const SizedBox(height: 30),

        Text(
          title,
          style: GoogleFonts.bricolageGrotesque(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColor.primarytext,
            height: 1.1,
          ),
        ),

        const SizedBox(height: 20),

        Text(
          description,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColor.primarytext.withValues(alpha: 0.75),
          ),
        ),
      ],
    );
  }
}
