import 'package:flutter/material.dart';

class Conversation {
  const Conversation({
    required this.name,
    required this.role,
    required this.lastMessage,
    required this.time,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    this.unread = 0,
  });

  final String name;
  final String role;
  final String lastMessage;
  final String time;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final int unread;

  String get title => role.isEmpty ? name : '$name · $role';
}
