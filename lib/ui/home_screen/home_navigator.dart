import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:depi_final_project/ui/home_screen/taps/chat_tap/chat_tap.dart';
import 'package:depi_final_project/ui/home_screen/taps/learn_tap/learn_tap.dart';
import 'package:depi_final_project/ui/home_screen/taps/profile_tap/profile_tap.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/vault_tap.dart';
import 'package:flutter/material.dart';
import '../../core/app_color/app_color.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({super.key});

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int currentIndex = 0;

  final List<Widget> screens = [
    const LearnTap(),
    const ChatTap(),
    const VaultTap(),
    const ProfileTap(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CircleBottomNavigation(
        barHeight: 75,
        initialSelection: currentIndex,
        barBackgroundColor: AppColor.white,
        circleColor: AppColor.primary,
        inactiveIconColor: AppColor.gray1,
        textColor: AppColor.primary,
        hasElevationShadows: true,
        tabs: [
          TabData(
            icon: Icons.explore_outlined,
            iconSize: 26,
            title: 'Learn',
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.chat_bubble_outline_rounded,
            iconSize: 26,
            title: 'Chat',
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.menu_book_outlined,
            iconSize: 26,
            title: 'Vault',
            fontWeight: FontWeight.bold,
          ),
          TabData(
            icon: Icons.person_outline_rounded,
            iconSize: 26,
            title: 'Profile',
            fontWeight: FontWeight.bold,
          ),
        ],
        onTabChangedListener: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}