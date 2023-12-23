import 'package:flutter/material.dart';
import 'auth.dart';

class SignUpWithPhone extends StatelessWidget {
  const SignUpWithPhone({super.key});

  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Sign Up'),
    Tab(text: 'Numberphone'),
    Tab(text: 'Code'),
    Tab(text: 'Profile'),
    Tab(text: 'Gender'),
    Tab(text: 'Passion'),
    Tab(text: 'Friend'),
    Tab(text: 'Notification'),

  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (context) {
          final TabController tabController = DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // Your code goes here.
              // To get index of current tab use tabController.index
            }
          });
          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              SignUpScreen (tabController: tabController),
              NumberPhoneScreen(tabController: tabController),
              CodeScreen(tabController: tabController),
              ProfileScreen(tabController: tabController),
              GenderScreen(tabController: tabController),
              PassionScreen(tabController: tabController),
              FriendScreen(tabController: tabController),
              NotificationScreen(tabController: tabController),
              
              // SignIn(
              //   tabController: tabController,
              // ),
            ],
          );
        },
      ),
    );
  }
}
