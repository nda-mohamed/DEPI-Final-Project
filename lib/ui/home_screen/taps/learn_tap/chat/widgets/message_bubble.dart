import 'package:depi_final_project/data/models/chat_message.dart';
import 'package:flutter/material.dart';

import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:depi_final_project/core/theme/app_text_styles.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
    required this.onWordTap,
  });

  final ChatMessage message;
  final ValueChanged<String> onWordTap;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width * 0.78;

    return switch (message.type) {
      MessageType.tutor => Align(
          alignment: Alignment.centerLeft,
          child: _bubble(
            maxWidth: maxWidth,
            color: AppColor.surface,
            border: AppColor.border,
            textColor: AppColor.textPrimary,
            tappable: true,
          ),
        ),
      MessageType.user => Align(
          alignment: Alignment.centerRight,
          child: _bubble(
            maxWidth: maxWidth,
            color: AppColor.primary,
            textColor: Colors.white,
            tappable: true,
          ),
        ),
      MessageType.correction => Align(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: AppColor.mint,
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Icon(Icons.auto_awesome_rounded,
                      size: 18, color: AppColor.darkSurface),
                ),
                const SizedBox(width: AppSpacing.sm),
                Flexible(
                  child: Text(
                    message.text,
                    style: AppTextStyles.body.copyWith(
                      color: AppColor.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    };
  }

  Widget _bubble({
    required double maxWidth,
    required Color color,
    required Color textColor,
    required bool tappable,
    Color? border,
  }) {
    final words = message.text.split(' ');

    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: color,
       borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(35),
      topRight: Radius.circular(35),
      bottomLeft: Radius.circular(12),
      bottomRight: Radius.circular(35),
    ),
        border: border == null ? null : Border.all(color: border),
      ),
      child: Wrap(
        spacing: 5,
        runSpacing: 2,
        children: [
          for (final w in words)
            _Word(
              text: w,
              color: textColor,
              highlighted: message.highlight != null &&
                  w.toLowerCase().contains(message.highlight!.toLowerCase()),
              onTap: tappable ? () => onWordTap(w) : null,
            ),
        ],
      ),
    );
  }
}

class _Word extends StatelessWidget {
  const _Word({
    required this.text,
    required this.color,
    required this.highlighted,
    this.onTap,
  });

  final String text;
  final Color color;
  final bool highlighted;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: highlighted
            ? BoxDecoration(
                color: AppColor.mint,
                borderRadius: BorderRadius.circular(6),
              )
            : null,
        padding: highlighted
            ? const EdgeInsets.symmetric(horizontal: 3)
            : EdgeInsets.zero,
        child: Text(
          text,
          style: AppTextStyles.body.copyWith(
            color: highlighted ? AppColor.textPrimary : color,
            fontSize: 17,
            decoration: onTap == null || highlighted
                ? TextDecoration.none
                : TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dotted,
            decorationColor: color.withValues(alpha: 0.6),
          ),
        ),
      ),
    );
  }
}
