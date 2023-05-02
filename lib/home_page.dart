import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:speak_it_kz/assets/my_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [Text('Home'), Text('Pomodoro'), Text('Flashcards'), Text('Quizes'), Text('Account')];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.home, color: myColor),
          inactiveIcon: const Icon(
            Icons.home,
            color: Colors.grey,
          )),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.timer, color: myColor),
      inactiveIcon: const Icon(
            Icons.timer,
            color: Colors.grey,
          )),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.amp_stories_rounded, color: myColor),
          inactiveIcon: const Icon(
            Icons.amp_stories_rounded,
            color: Colors.grey,
          )),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.quiz_rounded, color: myColor),
          inactiveIcon: const Icon(
            Icons.quiz_rounded,
            color: Colors.grey,
          )),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.account_circle_rounded, color: myColor),
          inactiveIcon: const Icon(
            Icons.account_circle_rounded,
            color: Colors.grey,
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
