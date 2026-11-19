import 'package:depi_final_project/core/widgets/primary_button.dart';
import 'package:depi_final_project/core/widgets/tag_chip.dart';
import 'package:depi_final_project/data/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:depi_final_project/core/theme/app_text_styles.dart';
import 'package:depi_final_project/core/widgets/circle_icon_button.dart';
/// Floating card with word translation + "Save to Vault".
class WordPopup extends StatefulWidget {
  const WordPopup({
    super.key,
    required this.definition,
    required this.onClose,
    required this.onSave,
  });

  final WordDefinition definition;
  final VoidCallback onClose;
  final VoidCallback onSave;

  @override
  State<WordPopup> createState() => _WordPopupState();
}

class _WordPopupState extends State<WordPopup> {
  final _tts = FlutterTts();

  @override
  void dispose() {
    _tts.stop();
    super.dispose();
  }

  Future<void> _speak() async {
    await _tts.setLanguage('es-ES');
    await _tts.speak(widget.definition.word);
  }

  @override
  Widget build(BuildContext context) {
    final definition = widget.definition;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  definition.word,
                  style: AppTextStyles.h1.copyWith(fontSize: 28),
                ),
              ),
              CircleIconButton(
                icon: Icons.volume_up_outlined,
                onTap: _speak,
                size: 40,
                background: AppColor.surfaceMuted,
                bordered: false,
              ),
              const SizedBox(width: AppSpacing.sm),
              IconButton(
                onPressed: widget.onClose,
                icon: const Icon(Icons.close_rounded),
              ),
            ],
          ),
          if (definition.pronunciation.isNotEmpty)
            Text(definition.pronunciation, style: AppTextStyles.bodyMuted),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Flexible(
                child: Text(
                  definition.translation,
                  style: AppTextStyles.h2,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              TagChip(
                label: definition.partOfSpeech,
                background: AppColor.surfaceMuted,
                foreground: AppColor.textSecondary,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          PrimaryButton(
            label: 'Save to Vault',
            icon: Icons.bookmark_add_outlined,
            style: AppButtonStyle.dark,
            height: 54,
            onPressed: widget.onSave,
          ),
        ],
      ),
    );
  }
}
