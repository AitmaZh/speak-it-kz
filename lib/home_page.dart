import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:speak_it_kz/assets/my_colors.dart';
import 'src/features/pomodoro/presentation/screens/pomodoro_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      Text('Home'),
      PomodoroScreen(),
      Text('Flashcards'),
      Text('Quizes'),
      Text('Account')
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.home, color: primaryColor),
          inactiveIcon: Icon(
            Icons.home,
            color: inactiveNavbarIconsColor,
          )),
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
          icon: Icon(Icons.quiz_rounded, color: primaryColor),
          inactiveIcon: Icon(
            Icons.quiz_rounded,
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
      navBarStyle: NavBarStyle.style13,
    );
  }
}
