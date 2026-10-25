import 'package:flutter/material.dart';
import 'package:depi_final_project/core/app_color/app_color.dart';

class FreeConversationCard extends StatelessWidget {
  final VoidCallback onTap;
  const FreeConversationCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.primary,
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white24,
                  border: Border.all(color: Colors.white54, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/tutor.png',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                    const Icon(Icons.person, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Free conversation',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Talk about anything with Sofía',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.3,
                        color: Color(0xDDFDFCF8),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: AppColor.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
