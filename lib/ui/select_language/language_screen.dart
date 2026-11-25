import 'package:flutter/material.dart';
import '../../core/app_color/app_color.dart';
import '../home_screen/home_navigator.dart';
import 'language_model.dart';
import 'language_options.dart';



class LanguageScreen extends StatefulWidget {
  final Language? initialSelected;
  const LanguageScreen({super.key, this.initialSelected});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  Language? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.secondary2),
                  ),
                  child: const Icon(Icons.chevron_left,
                      size: 26, color: AppColor.primarytext),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'I want to learn',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: AppColor.primarytext,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Pick the language you want to practice.',
                style: TextStyle(fontSize: 15, height: 1.4, color: AppColor.gray1),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.only(bottom: 12),
                  itemCount: allLanguages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.15,
                  ),
                  itemBuilder: (context, i) {
                    final lang = allLanguages[i];
                    return LanguageOption(
                      language: lang,
                      selected: _selected?.code == lang.code,
                      onTap: () => setState(() => _selected = lang),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 8),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _selected == null
                        ? null
                        : () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomeNavigator()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primary,
                      foregroundColor: AppColor.white,
                      disabledBackgroundColor: AppColor.secondary2,
                      disabledForegroundColor: AppColor.gray1,
                      elevation: 0,
                      shape: const StadiumBorder(),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    child: const Text('Continue'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
