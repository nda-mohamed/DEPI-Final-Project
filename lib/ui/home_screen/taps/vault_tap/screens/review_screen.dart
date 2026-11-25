import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/data/mock/mock_data.dart';
import 'package:depi_final_project/data/models/chat_message.dart';
import 'package:depi_final_project/ui/home_screen/home_navigator.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/cubits/review_cubit.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/cubits/review_state.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/data/word_progress.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/screens/review_done_screen.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/widgets/rating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewScreen extends StatelessWidget {
  final List<WordDefinition> words;
  final void Function(String word) onSpeak;

  const ReviewScreen({super.key, required this.words, required this.onSpeak});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReviewCubit(words),
      child: _ReviewView(onSpeak: onSpeak),
    );
  }
}

class _ReviewView extends StatelessWidget {
  final void Function(String word) onSpeak;
  const _ReviewView({required this.onSpeak});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: BlocBuilder<ReviewCubit, ReviewState>(
          builder: (context, state) {
            final cubit = context.read<ReviewCubit>();

            if (state.isFinished) {
              return ReviewDoneScreen(
                reviewed: state.total,
                accuracy: state.accuracy,
                xp: state.correct, // مؤقت
                streak: MockData.streak,
                onBack: () => Navigator.pop(context),
               onpractice: () {
  Navigator.pop(context);
  HomeNavigator.tabIndex.value = 0;
},
              );
            }

            return Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: Column(
                children: [
                  // الشريط العلوي
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        customBorder: const CircleBorder(),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColor.surface,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColor.border),
                          ),
                          child: const Icon(Icons.close,
                              color: AppColor.textPrimary),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: (state.index + 1) / state.total,
                            minHeight: 7,
                            backgroundColor: AppColor.secondary2,
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Text(
                        '${state.index + 1}/${state.total}',
                        style: const TextStyle(
                            color: AppColor.gray1, fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'TRANSLATE TO ENGLISH',
                    style: TextStyle(
                      color: AppColor.gray1,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // الكارت (الكلمة والترجمة بس)
                  Expanded(
                    child: GestureDetector(
                      onTap: cubit.flip,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColor.surface,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: AppColor.border),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () => onSpeak(state.current.word),
                              customBorder: const CircleBorder(),
                              child: Container(
                                width: 52,
                                height: 52,
                                decoration: const BoxDecoration(
                                  color: AppColor.primarySoft,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.volume_up_outlined,
                                    color: AppColor.primary),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              state.current.word,
                              style: const TextStyle(
                                color: AppColor.textPrimary,
                                fontSize: 34,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            if (state.current.pronunciation.isNotEmpty) ...[
                              const SizedBox(height: 6),
                              Text(
                                state.current.pronunciation,
                                style: const TextStyle(
                                    color: AppColor.gray1, fontSize: 13),
                              ),
                            ],
                            const SizedBox(height: 24),
                            if (state.isFlipped)
                              Text(
                                state.current.translation,
                                style: const TextStyle(
                                  color: AppColor.textPrimary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            else
                              const Text(
                                'Tap to reveal the translation',
                                style: TextStyle(
                                    color: AppColor.gray1, fontSize: 13),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ///==============================
                  const SizedBox(height: 16),
                  if (state.isFlipped) ...[
                    const Text(
                      'How well did you know it?',
                      style: TextStyle(fontSize: 12, color: AppColor.gray1),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: RatingButton(
                            label: 'Again',
                            time: '1m',
                            icon: Icons.refresh,
                            background: AppColor.rose,
                            foreground: AppColor.roseDark,
                          onTap: () => cubit.rate(Rating.again),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: RatingButton(
                            label: 'Hard',
                            time: '1d',
                            icon: Icons.local_fire_department_outlined,
                            background: AppColor.yellowlight,
                            foreground: AppColor.yellowDark,
                           onTap: () => cubit.rate(Rating.hard),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: RatingButton(
                            label: 'Easy',
                            time: '4d',
                            icon: Icons.check,
                            background: AppColor.mint,
                            foreground: AppColor.mintDark,
                            onTap: () => cubit.rate(Rating.easy),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}