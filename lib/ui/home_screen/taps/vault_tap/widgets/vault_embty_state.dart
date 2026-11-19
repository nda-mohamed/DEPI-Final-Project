

import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:flutter/material.dart';


class VaultEmbtyState extends StatelessWidget {
  final VoidCallback onStartConversation;
  const VaultEmbtyState({super.key, required this.onStartConversation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColor.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.bookmark_border,
                size: 36, color: AppColor.primary),
          ),
          const SizedBox(height: 20),
          const Text('Your vault is empty',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColor.dark
                  )
                  ),
          const SizedBox(height: 8),
          const Text(
            'Tap any word during a conversation and save it here to review later.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: AppColor.gray1, height: 1.4),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: onStartConversation,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: const Text('Start a conversation',
                style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}