import 'package:flutter/material.dart';

import 'package:depi_final_project/core/app_color/app_color.dart';
import '../models/chat_message.dart';
import '../models/conversation.dart';
import '../models/scenario.dart';


abstract final class MockData {
  static const String userName = 'Lucía';
  static const int streak = 14;
  static const double dailyGoalProgress = 0.6;

  static const List<Scenario> scenarios = [
    Scenario(
      title: 'Ordering at a café',
      city: 'Madrid',
      minutes: 5,
      level: CefrLevel.a1,
      icon: Icons.local_cafe_outlined,
      iconBg: AppColor.primarySoft,
      iconColor: AppColor.primary,
      progress: 0.55,
      mission: ['Greet the barista', 'Order a drink and a snack', 'Ask for the bill'],
      keyPhrases: ['Quisiera...', 'café con leche', '¿Cuánto es?', 'para llevar'],
    ),
    Scenario(
      title: 'Checking into a hotel',
      city: 'Barcelona',
      minutes: 7,
      level: CefrLevel.a2,
      icon: Icons.bed_outlined,
      iconBg: AppColor.mint,
      iconColor: AppColor.mintDark,
      progress: 0.25,
    ),
    Scenario(
      title: 'Asking for directions',
      city: 'Sevilla',
      minutes: 6,
      level: CefrLevel.a2,
      icon: Icons.person_pin_circle_outlined,
      iconBg: AppColor.yellowlight,
      iconColor: AppColor.yellowDark,
    ),
    Scenario(
      title: 'Job interview',
      city: 'Mexico City',
      minutes: 12,
      level: CefrLevel.b1,
      icon: Icons.work_outline_rounded,
      iconBg: AppColor.slate,
      iconColor: AppColor.slateDark,
    ),
    Scenario(
      title: 'At the pharmacy',
      city: 'Bogotá',
      minutes: 8,
      level: CefrLevel.b1,
      icon: Icons.medication_outlined,
      iconBg: AppColor.rose,
      iconColor: AppColor.roseDark,
    ),
        Scenario(
      title: 'Shopping for clothes',
      city: 'Madrid',
      minutes: 8,
      level: CefrLevel.a2,
      icon: Icons.shopping_bag_outlined,
      iconBg: AppColor.mint,
      iconColor: AppColor.mintDark,
    ),
  ];

  static const List<ChatMessage> cafeChat = [
    ChatMessage(
      type: MessageType.tutor,
      text: '¡Hola! Bienvenida al Café Sol. ¿Qué te gustaría tomar hoy?',
      highlight: 'gustaría',
    ),
    ChatMessage(
      type: MessageType.user,
      text: 'Quisiera un café con leche, por favor.',
    ),
    ChatMessage(
      type: MessageType.correction,
      text: 'Nice! Quisiera sounds more polite than quiero.',
    ),
    ChatMessage(
      type: MessageType.tutor,
      text: '¡Perfecto! ¿Lo quieres grande o pequeño? También',
    ),
  ];

  static const WordDefinition gustaria = WordDefinition(
    word: 'gustaría',
    pronunciation: '/goos-tah-REE-ah/',
    translation: 'would like',
    partOfSpeech: 'verb · conditional',
  );

  /// Tiny offline dictionary keyed by lowercase word (no punctuation).
  static const Map<String, WordDefinition> dictionary = {
    'gustaría': gustaria,
    'bienvenida': WordDefinition(
      word: 'bienvenida',
      pronunciation: '/byen-veh-NEE-dah/',
      translation: 'welcome',
      partOfSpeech: 'adjective · feminine',
    ),
    'tomar': WordDefinition(
      word: 'tomar',
      pronunciation: '/toh-MAR/',
      translation: 'to take, to drink',
      partOfSpeech: 'verb · infinitive',
    ),
    'quisiera': WordDefinition(
      word: 'quisiera',
      pronunciation: '/kee-SYEH-rah/',
      translation: 'I would like',
      partOfSpeech: 'verb · subjunctive',
    ),
    'leche': WordDefinition(
      word: 'leche',
      pronunciation: '/LEH-cheh/',
      translation: 'milk',
      partOfSpeech: 'noun · feminine',
    ),
    'grande': WordDefinition(
      word: 'grande',
      pronunciation: '/GRAN-deh/',
      translation: 'large',
      partOfSpeech: 'adjective',
    ),
    'pequeño': WordDefinition(
      word: 'pequeño',
      pronunciation: '/peh-KEH-nyo/',
      translation: 'small',
      partOfSpeech: 'adjective · masculine',
    ),
  };

  static const List<Conversation> conversations = [
    Conversation(
      name: 'Sofía',
      role: 'Barista',
      lastMessage: '¡Hasta luego! Que tengas un buen día.',
      time: '9:12',
      icon: Icons.local_cafe_outlined,
      iconBg: AppColor.primarySoft,
      iconColor: AppColor.primary,
    ),
    Conversation(
      name: 'Marco',
      role: 'Receptionist',
      lastMessage: 'Su habitación está en el tercer p…',
      time: 'Yesterday',
      icon: Icons.bed_outlined,
      iconBg: AppColor.mint,
      iconColor: AppColor.mintDark,
      unread: 2,
    ),
    Conversation(
      name: 'Free talk',
      role: '',
      lastMessage: 'Cuéntame sobre tu fin de semana…',
      time: 'Mon',
      icon: Icons.star_border_rounded,
      iconBg: AppColor.yellow,
      iconColor: AppColor.yellowDark,
    ),
    Conversation(
      name: 'Elena',
      role: 'Recruiter',
      lastMessage: '¿Por qué quieres este trabajo?',
      time: 'Sun',
      icon: Icons.work_outline_rounded,
      iconBg: AppColor.slate,
      iconColor: AppColor.slateDark,
    ),
    Conversation(
      name: 'Dr. Ruiz',
      role: 'Pharmacist',
      lastMessage: 'Tome una pastilla cada ocho horas.',
      time: 'Sat',
      icon: Icons.medication_outlined,
      iconBg: AppColor.rose,
      iconColor: AppColor.roseDark,
    ),
  ];
}
