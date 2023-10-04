import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../navigation/navigation.dart';
import '../theme/color_schemes.dart';
import 'chat/chat_screen.dart';
import 'home/home_screen.dart';
import 'match/match_screen.dart';
import 'setting/setting_screen.dart';

class MainScreen extends StatefulWidget {

  const MainScreen({super.key, required this.currentTab});
  final int currentTab;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static List<Widget> screens = <Widget>[
    HomeScreen(),
    MatchScreen(),
    ChatScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(index: widget.currentTab, children: screens),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: bgColor,
          showSelectedLabels: false,
          selectedItemColor: redColor,
          unselectedItemColor: Colors.grey,
          currentIndex: widget.currentTab,
          //disable animation when switch tab
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              context.go(NavigationPath.mainScreen.replaceFirst(':tab', '$index'));
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.style_rounded,
                // color: Colors.grey,
              ),
              label: 'swipe',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_rounded,
                // color: Colors.grey,
              ),
              label: 'match',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_rounded,
                // color: Colors.grey,
              ),
              label: 'chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_rounded,
                // color: Colors.grey,
              ),
              label: 'profile',
            ),
          ],
        ));
  }
}
