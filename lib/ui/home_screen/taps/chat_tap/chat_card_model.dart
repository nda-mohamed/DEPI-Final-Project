import 'package:flutter/material.dart';
import 'package:depi_final_project/core/app_color/app_color.dart';

class ChatItem {
  final String name;
  final String lastMessage;
  final String time;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final int unread;

  const ChatItem({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    this.unread = 0,
  });
}

const mockChats = <ChatItem>[
  ChatItem(
    name: 'Sofía · Barista',
    lastMessage: '¡Hasta luego! Que tengas un buen día.',
    time: '9:12',
    icon: Icons.coffee_outlined,
    bgColor: Color(0xFFFBE4DC),
    iconColor: AppColor.primary,
  ),
  ChatItem(
    name: 'Marco · Receptionist',
    lastMessage: 'Su habitación está en el tercer piso.',
    time: 'Yesterday',
    icon: Icons.bed_outlined,
    bgColor: AppColor.green1,
    iconColor: AppColor.green3,
    unread: 2,
  ),
  ChatItem(
    name: 'Free talk',
    lastMessage: 'Cuéntame sobre tu fin de semana…',
    time: 'Mon',
    icon: Icons.star_border_rounded,
    bgColor: Color(0xFFFBEAC4),
    iconColor: AppColor.primarytext,
  ),
  ChatItem(
    name: 'Elena · Recruiter',
    lastMessage: '¿Por qué quieres este trabajo?',
    time: 'Sun',
    icon: Icons.work_outline_rounded,
    bgColor: Color(0xFFE2E2E4),
    iconColor: AppColor.gray2,
  ),
  ChatItem(
    name: 'Dr. Ruiz · Pharmacist',
    lastMessage: 'Tome una pastilla cada ocho horas.',
    time: 'Sat',
    icon: Icons.medication_outlined,
    bgColor: Color(0xFFFBDDDD),
    iconColor: AppColor.red,
  ),
];
