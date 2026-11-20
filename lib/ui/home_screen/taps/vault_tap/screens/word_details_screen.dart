



import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/data/models/chat_message.dart';
import 'package:depi_final_project/data/saved_words.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/widgets/stat_chip.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/widgets/word_hero_card.dart';
import 'package:flutter/material.dart';

class WordDetailsScreen extends StatelessWidget {
  final WordDefinition word;
  final VoidCallback onSpeak;

  const WordDetailsScreen({super.key, required this.word, required this.onSpeak});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _CircleButton(
                  icon:Icons.chevron_left,
                  onTap:() => Navigator.pop(context),
                ),

              ////// remove (بيمسح الكلمات من التخزين و يرجعك)
                   _CircleButton(
                  icon: Icons.delete_outline,
                  onTap: (){
                    SavedWords.remove(word);
                    Navigator.pop(context);
                  }
                ),
              ],
            ),
             ////////  بنبعت الكلمات و داله النطق 
            SizedBox(height: 20,),
            WordHeroCard(word: word, onSpeak: onSpeak),

            SizedBox(height: 12,),
            Row(
              children: [
                Expanded(child: StatChip(value: '0/5', label: 'Strength')),
                SizedBox(width: 8,),
                  Expanded(child: StatChip(value: 'Today', label: 'Next review')),
                   SizedBox(width: 8,),
                    Expanded(child: StatChip(value: '0x', label: 'seen')),
              ],
            )
          ],
        )
      ),
    );
  }
}
//////  تستخدم عشان نحذف و نرجع و هى خاصه بالملف ده فقط 
class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _CircleButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      customBorder: CircleBorder(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColor.surface,
          shape: BoxShape.circle,
          border: Border.all(color: AppColor.border),

        ),
        child: Icon(icon,size: 20,color:AppColor.textPrimary,),
      ),

    );
  }
}