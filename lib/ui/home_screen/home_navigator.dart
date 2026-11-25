import 'package:depi_final_project/ui/home_screen/taps/chat_tap/chat_tap.dart';
import 'package:depi_final_project/ui/home_screen/taps/learn_tap/learn_screen.dart';

import 'package:depi_final_project/ui/home_screen/taps/profile_tap/profile_tap.dart';
import 'package:depi_final_project/ui/home_screen/taps/vault_tap/vault_tap.dart';
import 'package:flutter/material.dart';
import '../../core/app_color/app_color.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({super.key});

  /// . أي شاشة تقدر تغيّره: HomeNavigator.tabIndex.value = 0
  static final ValueNotifier<int> tabIndex = ValueNotifier<int>(0);

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();

  // int currentIndex = 0;
}

class _HomeNavigatorState extends State<HomeNavigator> {
  List<Widget> screens = [LearnScreen(), ChatTap(), VaultTap(), ProfileTap()];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: HomeNavigator.tabIndex,
      builder: (context, currentIndex, _) {
        return Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 15)],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.grey.shade50,
                currentIndex: currentIndex,
                onTap: (value) => HomeNavigator.tabIndex.value = value,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore_outlined),
                    label: 'Learn',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble_outline_rounded),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book_outlined),
                    label: 'Vault',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_rounded),
                    label: 'Profile',
                  ),
                ],
                selectedItemColor: AppColor.primary,
                unselectedItemColor: AppColor.gray1,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}