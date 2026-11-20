



import 'package:depi_final_project/core/app_color/app_color.dart';
import 'package:depi_final_project/data/models/chat_message.dart';
import 'package:flutter/material.dart';

class WordHeroCard extends StatelessWidget {
  final WordDefinition word;
  final VoidCallback onSpeak;

  const WordHeroCard({super.key, required this.word, required this.onSpeak});

  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: AppColor.primary,
      borderRadius: BorderRadius.circular(28),
    ),
    child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          /// نوع الكلمه  من   wordDefinition
          word.partOfSpeech,
          style: TextStyle(
            fontSize: 12,
          color: AppColor.white.withValues(alpha: 0.8),
          ),
        ),
        SizedBox(height: 8,),
        //// el worddd-------------------------------
        Text(
          ///// word  خانه الكلمه من كارت
          word.word,
          style: TextStyle(
            fontSize: 40,
              fontWeight: FontWeight.w800,
              color:AppColor.white,
          )
        ),
        SizedBox(height: 4,),
        Text(
          ////  خانه النطق
           '/${word.pronunciation}/',
           style: TextStyle(
            fontSize: 13,
            color:AppColor.white.withValues(alpha: 0.8),
           ),
        ),
        SizedBox(height: 24,),
        ////// el translationnnnnn------------------
        
        Row(
          children: [
            Expanded(
              child: Text(
                //// خانه الترجمه 
                word.translation,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColor.white,
                ),
              )
            ),
            InkWell(onTap: onSpeak,
            customBorder: CircleBorder() ,
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppColor.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.volume_up_outlined,
              size: 20,
              color:AppColor.primary),
            ),
            )
          ],
        )
      ],
    ) ,
    );
  }
}