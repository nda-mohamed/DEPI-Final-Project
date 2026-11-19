import 'package:depi_final_project/core/widgets/tag_chip.dart';
import 'package:depi_final_project/core/widgets/tutor_avatar.dart';
import 'package:depi_final_project/data/mock/mock_data.dart';
import 'package:depi_final_project/data/models/chat_message.dart';
import 'package:depi_final_project/data/models/scenario.dart';
import 'package:depi_final_project/data/saved_words.dart';
import 'package:depi_final_project/ui/home_screen/taps/learn_tap/voice_call/voice_call_screen.dart';
import 'package:flutter/material.dart';

import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:depi_final_project/core/theme/app_text_styles.dart';

import 'widgets/chat_input_bar.dart';
import 'widgets/message_bubble.dart';
import 'widgets/word_popup.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.scenario});

  final Scenario scenario;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  WordDefinition? _selected;
  final _scrollController = ScrollController();
  late final List<ChatMessage> _messages = List<ChatMessage>.of(
    MockData.cafeChat,
  );

  void _sendMessage(String text) {
    setState(() {
      _messages.add(ChatMessage(type: MessageType.user, text: text));
      _messages.add(ChatMessage(
        type: MessageType.tutor,
        text: _replyTo(text),
      ));
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String _replyTo(String text) {
    final normalized = text.toLowerCase();
    if (normalized.contains('hola') || normalized.contains('hello')) {
      return '¡Hola! Me alegra practicar contigo. ¿Qué te gustaría hacer hoy?';
    }
    if (normalized.contains('gracias') || normalized.contains('thank')) {
      return '¡De nada! You can also say “muchas gracias” for extra warmth.';
    }
    return '¡Muy bien! ¿Puedes contarme un poco más? Try using a complete sentence in Spanish.';
  }

  void _onWordTap(String raw) {
    final key =
        raw.toLowerCase().replaceAll(RegExp(r'[^\p{L}]', unicode: true), '');
    if (key.isEmpty) return;
    setState(() {
      _selected = MockData.dictionary[key] ??
          WordDefinition(
            word: key,
            pronunciation: '',
            translation: 'No translation yet',
            partOfSpeech: 'word',
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _Header(scenario: widget.scenario),
            const Divider(),
            Expanded(
              child: Stack(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => setState(() => _selected = null),
                    child: ListView(
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.lg,
                        AppSpacing.md,
                        AppSpacing.lg,
                        AppSpacing.xxl,
                      ),
                      children: [
                        const Center(
                          child: TagChip(
                            label: 'Tap any word to translate it',
                            background: AppColor.surfaceMuted,
                            foreground: AppColor.textSecondary,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        for (final m in _messages) ...[
                          MessageBubble(message: m, onWordTap: _onWordTap),
                          const SizedBox(height: AppSpacing.md),
                        ],
                      ],
                    ),
                  ),
                  if (_selected != null)
                    Positioned(
                      left: AppSpacing.sm,
                      right: AppSpacing.sm,
                      bottom: AppSpacing.sm,
                      child: WordPopup(
                        definition: _selected!,
                        onClose: () => setState(() => _selected = null),
                        onSave: () {
                          SavedWords.save(_selected!);
                          setState(() => _selected = null);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Saved to your Vault')),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
            ChatInputBar(
              hint: 'Responde en español.',
              onMic: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => VoiceCallScreen(scenario: widget.scenario),
                ),
              ),
              onSend: _sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.scenario});

  final Scenario scenario;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.sm, AppSpacing.sm, AppSpacing.lg, AppSpacing.md),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.chevron_left_rounded, size: 32),
          ),
          const TutorAvatar(size: 48),
          const SizedBox(width: AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sofía · Barista', style: AppTextStyles.title),
              const SizedBox(height: 2),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColor.mintDark,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${scenario.title} · ${scenario.level.label}',
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
