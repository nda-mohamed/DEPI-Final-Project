import 'package:flutter/material.dart';
import '../../../../core/app_color/app_color.dart';
import 'chat_card.dart';
import 'chat_card_model.dart';
import 'free_conversation_card.dart';

class ChatTap extends StatelessWidget {
  const ChatTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Chats',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primarytext,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    customBorder: const CircleBorder(),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColor.secondary2),
                      ),
                      child: const Icon(Icons.search,
                          size: 22, color: AppColor.primarytext),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              FreeConversationCard(onTap: () {
              }),
              const SizedBox(height: 24),
              const Text(
                'RECENT',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8,
                  color: AppColor.gray1,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: mockChats.length,
                  separatorBuilder: (_, __) => const Padding(
                    padding: EdgeInsets.only(left: 68),
                    child: Divider(height: 1, color: AppColor.secondary2),
                  ),
                  itemBuilder: (context, i) => ChatTile(
                    chat: mockChats[i],
                    onTap: () {

                    },
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
