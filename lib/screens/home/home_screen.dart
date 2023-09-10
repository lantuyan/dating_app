import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/model.dart';
import '../../navigation/navigation.dart';
import '../../theme/color_schemes.dart';
import '../../theme/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0, 96),
          child: Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
            child: AppBar(
              leading: const BackToScreenButton(
                  backRoute: NavigationPath.onboarding),
              title: const Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Discover',
                      style: TextStyle(
                        color: redColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Chicago, II',
                      style: TextStyle(
                        color: redColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              actions: const [
                FilterButton(),
              ],
            ),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 40),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    UserCard(user: User.users[0]),
                    const SizedBox(height: 40),

                    // 3 Buttons: Match, Pass, View Profile
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Pass Button
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: whiteColor,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.close_rounded,
                              color: orangeColor,
                              size: 30,
                            ),
                            color: redColor,
                            onPressed: () {},
                          ),
                        ),

                        // View Profile Button with icon is farveite, big circle with red background
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: redColor,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.favorite_rounded,
                              color: whiteColor,
                              size: 40,
                            ),
                            color: whiteColor,
                            onPressed: () {},
                          ),
                        ),
                        // Match Button with star icon,  circle,
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: whiteColor,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.star_rounded,
                              color: Colors.purple,
                              size: 30,
                            ),
                            color: redColor,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ]),
              // continueButon(),
            ],
          ),
        ),
        bottomNavigationBar: const NavigationBar(),
      ),
    );
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: bgColor,
      showSelectedLabels: false,
      selectedItemColor: redColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.style_rounded,
            color: redColor,
          ),
          label: 'swipe',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_rounded,
            color: Colors.grey,
          ),
          label: 'match',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat_bubble_rounded,
            color: Colors.grey,
          ),
          label: 'chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_rounded,
            color: Colors.grey,
          ),
          label: 'profile',
        ),
      ],
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 1.8,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(user.imageUrls[0]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.4),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: whiteColor,
                      size: 20,
                    ),
                    Text(
                      '${1 + 2} km',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    // width: equal width parent container
                    // width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${user.name}, ${user.age}',
                          style: const TextStyle(
                            color: whiteColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${user.jobTitle}',
                          style: const TextStyle(
                            color: whiteColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              right: -25,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 90,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle_rounded,
                            color: whiteColor,
                            size: 8,
                          ),
                          SizedBox(height: 5),
                          Icon(
                            Icons.circle_rounded,
                            color: whiteColor.withOpacity(0.3),
                            size: 8,
                          ),
                          SizedBox(height: 5),
                          Icon(
                            Icons.circle_rounded,
                            color: whiteColor.withOpacity(0.3),
                            size: 8,
                          ),
                          SizedBox(height: 5),
                          Icon(
                            Icons.circle_rounded,
                            color: whiteColor.withOpacity(0.3),
                            size: 8,
                          ),
                          SizedBox(height: 5),
                          Icon(
                            Icons.circle_rounded,
                            color: whiteColor.withOpacity(0.3),
                            size: 8,
                          ),
                        ],
                      ),
                       Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle_rounded,
                            color: redColor,
                            size: 8,
                          ),
                          SizedBox(height: 5),
                          Icon(
                            Icons.circle_rounded,
                            color: redColor.withOpacity(0.3),
                            size: 8,
                          ),
                          SizedBox(height: 5),
                          Icon(
                            Icons.circle_rounded,
                            color: redColor.withOpacity(0.3),
                            size: 8,
                          ),
                          SizedBox(height: 5),
                          Icon(
                            Icons.circle_rounded,
                            color: redColor.withOpacity(0.3),
                            size: 8,
                          ),
                          SizedBox(height: 5),
                          Icon(
                            Icons.circle_rounded,
                            color: redColor.withOpacity(0.3),
                            size: 8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class BackToScreenButton extends StatelessWidget {
  final String backRoute;

  const BackToScreenButton({
    super.key,
    required this.backRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: borderColor,
          border: Border.all(
            color: borderColor,
            width: 2.0,
          )),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: redColor,
          size: 20,
        ),
        color: redColor,
        onPressed: () {
          context.go(backRoute);
        },
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // color: borderColor,
          border: Border.all(
            color: borderColor,
            width: 2.0,
          )),
      child: IconButton(
        icon: const Icon(
          Icons.tune_rounded,
          color: redColor,
          size: 20,
        ),
        color: redColor,
        onPressed: () {},
      ),
    );
  }
}
