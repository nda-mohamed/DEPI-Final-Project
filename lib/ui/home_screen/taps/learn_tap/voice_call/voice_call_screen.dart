import 'package:depi_final_project/ui/home_screen/taps/learn_tap/results/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;


import 'package:depi_final_project/data/models/scenario.dart';


import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/core/app_spacing/app_spacing.dart';
import 'package:depi_final_project/core/theme/app_text_styles.dart';
import 'package:depi_final_project/core/widgets/circle_icon_button.dart';
import 'widgets/pulsing_avatar.dart';

class VoiceCallScreen extends StatefulWidget {
  const VoiceCallScreen({super.key, required this.scenario});

  final Scenario scenario;

  @override
  State<VoiceCallScreen> createState() => _VoiceCallScreenState();
}

class _VoiceCallScreenState extends State<VoiceCallScreen> {
  final _speech = stt.SpeechToText();
  final _tts = FlutterTts();
  bool _available = false;
  bool _listening = false;
  String _transcript = '';
  String _reply = '¡Perfecto! ¿Lo quieres grande o pequeño?';

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
    _speak(_reply);
  }

  Future<void> _initializeSpeech() async {
    _available = await _speech.initialize(
      onStatus: (status) {
        if (status == 'notListening' && mounted) {
          setState(() => _listening = false);
        }
      },
      onError: (_) {
        if (mounted) setState(() => _listening = false);
      },
    );
    if (mounted) setState(() {});
  }

  Future<void> _speak(String text) async {
    await _tts.setLanguage('es-ES');
    await _tts.speak(text);
  }

  Future<void> _toggleListening() async {
    if (_listening) {
      await _speech.stop();
      setState(() => _listening = false);
      if (_transcript.trim().isNotEmpty) {
        setState(() => _reply =
            '¡Gracias! Practiquemos un poco más. ¿Qué te gustaría pedir?');
        await _speak(_reply);
      }
      return;
    }
    if (!_available) {
      await _initializeSpeech();
    }
    if (!_available) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Speech recognition is unavailable on this device.')),
        );
      }
      return;
    }
    _transcript = '';
    await _speech.listen(
      listenOptions: stt.SpeechListenOptions(
        localeId: 'es_ES',
        listenFor: const Duration(seconds: 30),
        listenMode: stt.ListenMode.dictation,
      ),
      onResult: (result) {
        if (mounted) setState(() => _transcript = result.recognizedWords);
      },
    );
    if (mounted) setState(() => _listening = true);
  }

  Future<void> _typeMessage() async {
    final controller = TextEditingController();
    final text = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Type a reply'),
        content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Write in Spanish')),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
              onPressed: () => Navigator.pop(context, controller.text.trim()),
              child: const Text('Send')),
        ],
      ),
    );
    controller.dispose();
    if (text == null || text.isEmpty) return;
    setState(() {
      _transcript = text;
      _reply = '¡Muy bien! ¿Puedes contarme un poco más?';
    });
    await _speak(_reply);
  }

  void _finish(BuildContext context) {
    _speech.stop();
    _tts.stop();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (_) => ResultsScreen(scenario: widget.scenario)),
    );
  }

  @override
  void dispose() {
    _speech.stop();
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.dark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.md),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${widget.scenario.title} · Voice practice',
                      style: AppTextStyles.bodyMuted
                          .copyWith(color: AppColor.textOnDarkMuted),
                    ),
                  ),
                  CircleIconButton(
                    icon: Icons.close_rounded,
                    onTap: () => _finish(context),
                    size: 48,
                    background: AppColor.darkSurface,
                    color: Colors.white,
                    bordered: false,
                  ),
                ],
              ),
              const Spacer(flex: 2),
              const PulsingAvatar(
                size: 190,
              ),
              const SizedBox(height: AppSpacing.xxxl),
              Text(
                _listening ? 'Listening…' : 'Sofía is speaking...',
                style: AppTextStyles.h2
                    .copyWith(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                '"$_reply"',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMuted.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                _transcript.isEmpty
                    ? 'Tap the microphone and speak in Spanish'
                    : 'You: $_transcript',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMuted
                    .copyWith(color: AppColor.textOnDarkMuted),
              ),
              const Spacer(flex: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleIconButton(
                    icon: Icons.keyboard_alt_outlined,
                    onTap: _typeMessage,
                    size: 64,
                    background: AppColor.darkSurface,
                    color: Colors.white,
                    bordered: false,
                  ),
                  const SizedBox(width: 28),
                  GestureDetector(
                    onTap: _toggleListening,
                    child: Container(
                      width: 92,
                      height: 92,
                      decoration: BoxDecoration(
                        color:
                            _listening ? AppColor.mintDark : AppColor.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                          _listening ? Icons.stop_rounded : Icons.graphic_eq_rounded,
                          color: Colors.white,
                          size: 42),
                    ),
                  ),
                  const SizedBox(width: 28),
                  CircleIconButton(
                    icon: Icons.volume_up_outlined,
                    onTap: () => _speak(_reply),
                    size: 64,
                    background: AppColor.darkSurface,
                    color: Colors.white,
                    bordered: false,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}
