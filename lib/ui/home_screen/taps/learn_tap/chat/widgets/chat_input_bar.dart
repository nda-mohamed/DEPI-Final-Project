import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:depi_final_project/core/theme/app_text_styles.dart';
import 'package:depi_final_project/core/widgets/circle_icon_button.dart';
import 'package:flutter/material.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({
    super.key,
    required this.hint,
    required this.onSend,
    required this.onMic,
  });

  final String hint;
  final ValueChanged<String> onSend;
  final VoidCallback onMic;

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSend(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.md),
      child: Row(
        children: [
          CircleIconButton(
            icon: Icons.mic_none_rounded,
            onTap: widget.onMic,
            size: 48,
            background: AppColor.surfaceMuted,
            bordered: false,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (_) => _send(),
              style: AppTextStyles.body,
              decoration: InputDecoration(
                hintText: widget.hint,
                hintStyle: AppTextStyles.body
                    .copyWith(color: AppColor.textSecondary),
                filled: true,
                fillColor: AppColor.surface,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: AppRadius.button,
                  borderSide: const BorderSide(color: AppColor.border),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: AppRadius.button,
                  borderSide: const BorderSide(color: AppColor.border),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: AppRadius.button,
                  borderSide: const BorderSide(color: AppColor.primary),
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          CircleIconButton(
            icon: Icons.send_rounded,
            onTap: _send,
            size: 48,
            background: AppColor.primary,
            color: Colors.white,
            bordered: false,
          ),
        ],
      ),
    );
  }
}
