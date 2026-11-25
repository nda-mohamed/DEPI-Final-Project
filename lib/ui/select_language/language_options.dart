import 'package:flutter/material.dart';
import '../../core/app_color/app_color.dart';
import 'language_model.dart';

class LanguageOption extends StatelessWidget {
  final Language language;
  final bool selected;
  final VoidCallback onTap;

  const LanguageOption({
    super.key,
    required this.language,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: selected ? const Color(0x26E8542F) : AppColor.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: selected ? AppColor.primary : AppColor.secondary2,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              language.code,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: selected ? AppColor.primary : AppColor.primarytext,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              language.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                color: selected ? AppColor.primary : AppColor.gray1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
