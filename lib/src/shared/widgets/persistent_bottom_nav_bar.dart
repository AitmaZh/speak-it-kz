import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:speak_it_kz/assets/my_colors.dart';

import 'package:speak_it_kz/src/features/flashcards/presentation/pages/flashcard_home_page.dart';
import '../../features/auth/presentation/screens/sign_to_system_page.dart';
import '../../features/pomodoro/presentation/screens/pomodoro_page.dart';
import '../../features/auth/presentation/screens/profile_page.dart';

class PersistentBottomNavBar extends StatefulWidget {
  const PersistentBottomNavBar({super.key});

  @override
  State<PersistentBottomNavBar> createState() => _PersistentBottomNavBarState();
}

class _PersistentBottomNavBarState extends State<PersistentBottomNavBar> {
  final _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const PomodoroScreen(),
      FlashcardHomeScreen(),
      const SignToSystemScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.timer, color: primaryColor),
          inactiveIcon: Icon(
            Icons.timer,
            color: inactiveNavbarIconsColor,
          )),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.amp_stories_rounded, color: primaryColor),
          inactiveIcon: Icon(
            Icons.amp_stories_rounded,
            color: inactiveNavbarIconsColor,
          )),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.account_circle_rounded, color: primaryColor),
          inactiveIcon: Icon(
            Icons.account_circle_rounded,
            color: inactiveNavbarIconsColor,
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarItems(),
      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: 3,
            blurRadius: 6,
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
      navBarStyle: NavBarStyle.style13,
    );
  }
}
