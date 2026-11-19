


import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/data/models/chat_message.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/widgets/strength_bar.dart';
import 'package:flutter/material.dart';

class WordTile extends StatelessWidget{
final WordDefinition word;
  final int strength;
  final VoidCallback onTap;
  final VoidCallback onSpeak;
 WordTile({

super.key,
required this.word,
 required this.strength,
    required this.onTap,
    required this.onSpeak,
});

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
       onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical:12 ),
        child: Row(
          children: [
            InkWell(
              onTap: onSpeak,
              customBorder: CircleBorder(),
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: AppColor.secondary1,
                  shape: BoxShape.circle

                ),

                child: Icon(Icons.volume_up_outlined,
                size: 18,color: AppColor.textPrimary,),
              ),
            ),

            SizedBox(width: 12,),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(word.word,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textPrimary
                  ),),
                  SizedBox(height: 2,),
                  Text(word.translation,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,color: AppColor.gray1
                  ),)
              ],
            )),
             StrengthBar(strength: strength),
          ],
        ),
      ),
    );
  }
}