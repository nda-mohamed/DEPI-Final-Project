import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/app_color/app_color.dart';

class OnBoardingActionButton extends StatelessWidget {
  const OnBoardingActionButton({
    super.key,
    required this.isLastPage,
    required this.onPressed,
  });

  final bool isLastPage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isLastPage
          ? ElevatedButton(
              key: const ValueKey('getStartedBtn'),
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 4,
                shadowColor: AppColor.primary.withValues(alpha: 0.4),
              ),
              child: Row(
                children: [
                  Text(
                    'Get Started',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 8),

                  Icon(Icons.arrow_forward_rounded),
                ],
              ),
            )
          : Container(
              key: const ValueKey('arrowBtn'),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primary.withValues(alpha: 0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: onPressed,
                style: IconButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
                icon: const Icon(Icons.arrow_forward_rounded),
              ),
            ),
    );
  }
}
